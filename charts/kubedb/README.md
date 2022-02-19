# KubeDB

[KubeDB by AppsCode](https://github.com/kubedb) - Making running production-grade databases easy on Kubernetes

## TL;DR;

```console
$ helm repo add ak8sdb https://raw.githubusercontent.com/ak8sdb/installer/master/stable
$ helm repo update
$ helm install kubedb ak8sdb/kubedb -n kube-system
```

## Introduction

This chart deploys a KubeDB operator on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.16+

## Installing the Chart

To install the chart with the release name `kubedb`:

```console
$ helm install kubedb ak8sdb/kubedb -n kube-system
```

The command deploys a KubeDB operator on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `kubedb`:

```console
$ helm delete kubedb -n kube-system
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `kubedb` chart and their default values.

|                Parameter                |                                                                                                                                                                              Description                                                                                                                                                                              |           Default           |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------|
| global.license                          | License for the product. Get a license by following the steps from [here](https://kubedb.com/docs/latest/setup/install/enterprise#get-a-trial-license). <br> Example: <br> `helm install appscode/kubedb \` <br> `--set-file global.license=/path/to/license/file` <br> `or` <br> `helm install appscode/kubedb \` <br> `--set global.license=<license file content>` | <code>""</code>             |
| global.registry                         | Docker registry used to pull KubeDB related images                                                                                                                                                                                                                                                                                                                    | <code>""</code>             |
| global.registryFQDN                     | Docker registry fqdn used to pull KubeDB related images. Set this to use docker registry hosted at ${registryFQDN}/${registry}/${image}                                                                                                                                                                                                                               | <code>""</code>             |
| global.imagePullSecrets                 | Specify an array of imagePullSecrets. Secrets must be manually created in the namespace. <br> Example: <br> `helm template charts/kubedb \` <br> `--set global.imagePullSecrets[0].name=sec0 \` <br> `--set global.imagePullSecrets[1].name=sec1`                                                                                                                     | <code>[]</code>             |
| global.skipCleaner                      | Skip generating cleaner job YAML                                                                                                                                                                                                                                                                                                                                      | <code>false</code>          |
| global.monitoring.enabled               | If true, enables monitoring KubeDB operator                                                                                                                                                                                                                                                                                                                           | <code>false</code>          |
| global.monitoring.agent                 | Name of monitoring agent ("prometheus.io" or "prometheus.io/operator" or "prometheus.io/builtin")                                                                                                                                                                                                                                                                     | <code>""</code>             |
| global.monitoring.serviceMonitor.labels | Specify the labels for ServiceMonitor. Prometheus crd will select ServiceMonitor using these labels. Only usable when monitoring agent is `prometheus.io/operator`.                                                                                                                                                                                                   | <code>{}</code>             |
| kubedb-catalog.enabled                  | If enabled, installs the kubedb-catalog chart                                                                                                                                                                                                                                                                                                                         | <code>true</code>           |
| kubedb-catalog.catalog.elasticsearch    |                                                                                                                                                                                                                                                                                                                                                                       | <code>true</code>           |
| kubedb-catalog.catalog.etcd             |                                                                                                                                                                                                                                                                                                                                                                       | <code>false</code>          |
| kubedb-catalog.catalog.memcached        |                                                                                                                                                                                                                                                                                                                                                                       | <code>false</code>          |
| kubedb-catalog.catalog.mongo            |                                                                                                                                                                                                                                                                                                                                                                       | <code>true</code>           |
| kubedb-catalog.catalog.mysql            |                                                                                                                                                                                                                                                                                                                                                                       | <code>false</code>          |
| kubedb-catalog.catalog.mariadb          |                                                                                                                                                                                                                                                                                                                                                                       | <code>false</code>          |
| kubedb-catalog.catalog.perconaxtradb    |                                                                                                                                                                                                                                                                                                                                                                       | <code>false</code>          |
| kubedb-catalog.catalog.pgbouncer        |                                                                                                                                                                                                                                                                                                                                                                       | <code>false</code>          |
| kubedb-catalog.catalog.postgres         |                                                                                                                                                                                                                                                                                                                                                                       | <code>false</code>          |
| kubedb-catalog.catalog.proxysql         |                                                                                                                                                                                                                                                                                                                                                                       | <code>false</code>          |
| kubedb-catalog.catalog.redis            |                                                                                                                                                                                                                                                                                                                                                                       | <code>false</code>          |
| kubedb-community.enabled                | If enabled, installs the kubedb-community chart                                                                                                                                                                                                                                                                                                                       | <code>true</code>           |
| kubedb-community.operator.registry      | Docker registry used to pull KubeDB enterprise operator image                                                                                                                                                                                                                                                                                                         | <code>ghcr.io/ak8sdb</code> |
| kubedb-community.operator.tag           | KubeDB enterprise operator container image tag                                                                                                                                                                                                                                                                                                                        | <code>v2021.12.07</code>    |
| kubedb-enterprise.enabled               | If enabled, installs the kubedb-enterprise chart                                                                                                                                                                                                                                                                                                                      | <code>true</code>           |
| kubedb-enterprise.operator.registry     | Docker registry used to pull KubeDB enterprise operator image                                                                                                                                                                                                                                                                                                         | <code>ghcr.io/ak8sdb</code> |
| kubedb-enterprise.operator.tag          | KubeDB enterprise operator container image tag                                                                                                                                                                                                                                                                                                                        | <code>v2021.12.07</code>    |
| kubedb-autoscaler.enabled               | If enabled, installs the kubedb-autoscaler chart                                                                                                                                                                                                                                                                                                                      | <code>true</code>           |
| kubedb-autoscaler.operator.registry     | Docker registry used to pull KubeDB enterprise operator image                                                                                                                                                                                                                                                                                                         | <code>ghcr.io/ak8sdb</code> |
| kubedb-autoscaler.operator.tag          | KubeDB enterprise operator container image tag                                                                                                                                                                                                                                                                                                                        | <code>v2021.12.07</code>    |
| stash-community.enabled                 | If enabled, installs the stash-community chart                                                                                                                                                                                                                                                                                                                        | <code>true</code>           |
| stash-community.operator.registry       | Docker registry used to pull operator image                                                                                                                                                                                                                                                                                                                           | <code>ghcr.io/ak8sdb</code> |
| stash-community.operator.tag            | Operator container image tag                                                                                                                                                                                                                                                                                                                                          | <code>v2021.12.07</code>    |
| stash-catalog.enabled                   | If enabled, installs the stash-catalog chart                                                                                                                                                                                                                                                                                                                          | <code>true</code>           |
| stash-catalog.elasticsearch.enabled     | If true, deploys Elasticsearch addon                                                                                                                                                                                                                                                                                                                                  | <code>true</code>           |
| stash-catalog.mariadb.enabled           | If true, deploys MariaDB addon                                                                                                                                                                                                                                                                                                                                        | <code>false</code>          |
| stash-catalog.mongodb.enabled           | If true, deploys MongoDB addon                                                                                                                                                                                                                                                                                                                                        | <code>true</code>           |
| stash-catalog.mysql.enabled             | If true, deploys MySQL addon                                                                                                                                                                                                                                                                                                                                          | <code>false</code>          |
| stash-catalog.perconaxtradb.enabled     | If true, deploys Percona XtraDB addon                                                                                                                                                                                                                                                                                                                                 | <code>false</code>          |
| stash-catalog.postgres.enabled          | If true, deploys PostgreSQL addon                                                                                                                                                                                                                                                                                                                                     | <code>false</code>          |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example:

```console
$ helm install kubedb ak8sdb/kubedb -n kube-system --set kubedb-community.operator.registry=ghcr.io/ak8sdb
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while
installing the chart. For example:

```console
$ helm install kubedb ak8sdb/kubedb -n kube-system --values values.yaml
```
