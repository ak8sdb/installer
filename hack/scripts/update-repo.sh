#!/bin/bash

set -eou pipefail

SCRIPT_ROOT=$(realpath $(dirname "${BASH_SOURCE[0]}")/../..)
SCRIPT_NAME=$(basename "${BASH_SOURCE[0]}")

pushd $SCRIPT_ROOT

# http://redsymbol.net/articles/bash-exit-traps/
function cleanup() {
    popd
}
trap cleanup EXIT

CHARTS_DIR=charts
TMP_DIR="${SCRIPT_ROOT}/tmp"

REPO_DIR=${REPO_DIR:-stable}
REPO_URL=https://raw.githubusercontent.com/ak8sdb/installer/master/${REPO_DIR}/

# create temporary charts folder
mkdir -p $TMP_DIR/$CHARTS_DIR
# package charts
cd $SCRIPT_ROOT

helm dependency update charts/kubedb
find $CHARTS_DIR -maxdepth 1 -mindepth 1 -type d -exec helm package {} -d {} \;
rm -rf charts/kubedb/charts

cd $CHARTS_DIR
find . -maxdepth 1 -mindepth 1 -type d -exec mkdir -p $TMP_DIR/$CHARTS_DIR/{} \;
find . -path ./$CHARTS_DIR -prune -o -name '*.tgz' -exec mv {} $TMP_DIR/$CHARTS_DIR/{} \;

# update index
cd $TMP_DIR
mkdir -p $SCRIPT_ROOT/$REPO_DIR
if [ -f $SCRIPT_ROOT/$REPO_DIR/index.yaml ]; then
    helm repo index --merge $SCRIPT_ROOT/$REPO_DIR/index.yaml --url $REPO_URL $CHARTS_DIR
else
    helm repo index --url $REPO_URL $CHARTS_DIR
fi
mv $CHARTS_DIR/index.yaml $SCRIPT_ROOT/$REPO_DIR/index.yaml
cd $CHARTS_DIR
find . -maxdepth 1 -mindepth 1 -type d -exec mkdir -p $SCRIPT_ROOT/$REPO_DIR/{} \;
find . -path ./$CHARTS_DIR -prune -o -name '*.tgz' -exec mv {} $SCRIPT_ROOT/$REPO_DIR/{} \;
rm -rf $TMP_DIR
