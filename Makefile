# Copyright AppsCode Inc. and Contributors
#
# Licensed under the AppsCode Community License 1.0.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://github.com/appscode/licenses/raw/1.0.0/AppsCode-Community-1.0.0.md
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

SHELL=/bin/bash -o pipefail

GO_PKG   := github.com/ak8sdb
REPO     := $(notdir $(shell pwd))
BIN      := installer

# Used internally.  Users should pass GOOS and/or GOARCH.
OS   := $(if $(GOOS),$(GOOS),$(shell go env GOOS))
ARCH := $(if $(GOARCH),$(GOARCH),$(shell go env GOARCH))

GO_VERSION       ?= 1.22
BUILD_IMAGE      ?= ghcr.io/appscode/golang-dev:$(GO_VERSION)
CHART_TEST_IMAGE ?= quay.io/helmpack/chart-testing:v3.5.1

# Directories that we need created to build/test.
BUILD_DIRS  := bin/$(OS)_$(ARCH)     \
               .go/bin/$(OS)_$(ARCH) \
               .go/cache

DOCKER_REPO_ROOT := /go/src/$(GO_PKG)/$(REPO)

CHART_REGISTRY     ?= ak8sdb
CHART_REGISTRY_URL ?= https://raw.githubusercontent.com/ak8sdb/installer/master/stable
CHART_VERSION      ?= v2022.08.02
APP_VERSION        ?= $(CHART_VERSION)

fmt: $(BUILD_DIRS)
	@docker run                                                 \
	    -i                                                      \
	    --rm                                                    \
	    -u $$(id -u):$$(id -g)                                  \
	    -v $$(pwd):/src                                         \
	    -w /src                                                 \
	    -v $$(pwd)/.go/bin/$(OS)_$(ARCH):/go/bin                \
	    -v $$(pwd)/.go/bin/$(OS)_$(ARCH):/go/bin/$(OS)_$(ARCH)  \
	    -v $$(pwd)/.go/cache:/.cache                            \
	    --env HTTP_PROXY=$(HTTP_PROXY)                          \
	    --env HTTPS_PROXY=$(HTTPS_PROXY)                        \
	    $(BUILD_IMAGE)                                          \
	    /bin/bash -c "                                          \
	        set -eou pipefail;                                  \
	        go run ./hack/fmt/main.go;                          \
	        REPO_PKG=$(GO_PKG)                                  \
	        ./hack/fmt.sh $(SRC_DIRS)                           \
	    "

.PHONY: update-charts
update-charts: $(shell find $$(pwd)/charts -maxdepth 1 -mindepth 1 -type d -printf 'chart-%f ')

chart-%:
	@$(MAKE) contents-$* gen-chart-doc-$* --no-print-directory

contents-%:
	@yq -y --indentless -i '.repository.name="$(CHART_REGISTRY)"' ./charts/$*/doc.yaml
	@yq -y --indentless -i '.repository.url="$(CHART_REGISTRY_URL)"' ./charts/$*/doc.yaml
	@if [ -n "$(CHART_VERSION)" ]; then \
	  yq -y --indentless -i '.version="$(CHART_VERSION)"' ./charts/$*/Chart.yaml; \
	  yq -y --indentless -i '.dependencies |= map(select(.name == "$*").version="$(CHART_VERSION)")' ./charts/kubedb/Chart.yaml; \
	fi
	@if [ ! -z "$(APP_VERSION)" ]; then                                               \
		yq -y --indentless -i '.appVersion="$(APP_VERSION)"' ./charts/$*/Chart.yaml;    \
		case "$*" in                                                                    \
		  kubedb-community | kubedb-enterprise | kubedb-autoscaler)                     \
		    yqq w -i ./charts/$*/values.yaml operator.tag --tag '!!str' $(APP_VERSION); \
		    ;;                                                                          \
		esac;                                                                           \
	fi

.PHONY: gen-chart-doc
gen-chart-doc: $(shell find $$(pwd)/charts -maxdepth 1 -mindepth 1 -type d -printf 'gen-chart-doc-%f ')

gen-chart-doc-%:
	@echo "Generate $* chart docs"
	@docker run --rm 	                                 \
		-u $$(id -u):$$(id -g)                           \
		-v /tmp:/.cache                                  \
		-v $$(pwd):$(DOCKER_REPO_ROOT)                   \
		-w $(DOCKER_REPO_ROOT)                           \
		--env HTTP_PROXY=$(HTTP_PROXY)                   \
		--env HTTPS_PROXY=$(HTTPS_PROXY)                 \
		$(BUILD_IMAGE)                                   \
		chart-doc-gen -d ./charts/$*/doc.yaml -v ./charts/$*/values.yaml > ./charts/$*/README.md

$(BUILD_DIRS):
	@mkdir -p $@

.PHONY: clean
clean:
	rm -rf .go bin
