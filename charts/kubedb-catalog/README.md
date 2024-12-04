# KubeDB Catalog

[KubeDB Catalog](https://github.com/kubedb) - Catalog of database versions supported by KubeDB

## TL;DR;

```bash
$ helm repo add ak8sdb https://raw.githubusercontent.com/ak8sdb/installer/master/stable
$ helm repo update
$ helm search repo ak8sdb/kubedb-catalog --version=v2024.12.4
$ helm upgrade -i kubedb-catalog ak8sdb/kubedb-catalog -n kubedb --create-namespace --version=v2024.12.4
```

## Introduction

This chart deploys KubeDB catalog on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.20+

## Installing the Chart

To install/upgrade the chart with the release name `kubedb-catalog`:

```bash
$ helm upgrade -i kubedb-catalog ak8sdb/kubedb-catalog -n kubedb --create-namespace --version=v2024.12.4
```

The command deploys KubeDB catalog on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall the `kubedb-catalog`:

```bash
$ helm uninstall kubedb-catalog -n kubedb
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `kubedb-catalog` chart and their default values.

|                 Parameter                  |                   Description                   |           Default            |
|--------------------------------------------|-------------------------------------------------|------------------------------|
| nameOverride                               | Overrides name template                         | <code>""</code>              |
| fullnameOverride                           | Overrides fullname template                     | <code>""</code>              |
| proxies.dockerHub                          |                                                 | <code>""</code>              |
| proxies.dockerLibrary                      |                                                 | <code>""</code>              |
| proxies.ghcr                               |                                                 | <code>ghcr.io</code>         |
| proxies.kubernetes                         |                                                 | <code>registry.k8s.io</code> |
| featureGates.Elasticsearch                 |                                                 | <code>true</code>            |
| featureGates.MongoDB                       |                                                 | <code>true</code>            |
| psp.enabled                                |                                                 | <code>false</code>           |
| psp.elasticsearch.allowPrivilegeEscalation |                                                 | <code>true</code>            |
| psp.elasticsearch.privileged               |                                                 | <code>true</code>            |
| psp.mongodb.allowPrivilegeEscalation       |                                                 | <code>false</code>           |
| psp.mongodb.privileged                     |                                                 | <code>false</code>           |
| skipDeprecated                             | Set true to avoid deploying deprecated versions | <code>true</code>            |
| enableVersions.Elasticsearch               |                                                 | <code>[]</code>              |
| enableVersions.MongoDB                     |                                                 | <code>[]</code>              |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm upgrade -i`. For example:

```bash
$ helm upgrade -i kubedb-catalog ak8sdb/kubedb-catalog -n kubedb --create-namespace --version=v2024.12.4 --set proxies.ghcr=ghcr.io
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while
installing the chart. For example:

```bash
$ helm upgrade -i kubedb-catalog ak8sdb/kubedb-catalog -n kubedb --create-namespace --version=v2024.12.4 --values values.yaml
```
