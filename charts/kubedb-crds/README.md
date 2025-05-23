# KubeDB CRDs

[KubeDB CRDs](https://github.com/kubedb) - KubeDB Custom Resource Definitions

## TL;DR;

```bash
$ helm repo add ak8sdb https://raw.githubusercontent.com/ak8sdb/installer/master/stable
$ helm repo update
$ helm search repo ak8sdb/kubedb-crds --version=v2025.5.9
$ helm upgrade -i kubedb-crds ak8sdb/kubedb-crds -n kubedb --create-namespace --version=v2025.5.9
```

## Introduction

This chart deploys KubeDB crds on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.16+

## Installing the Chart

To install/upgrade the chart with the release name `kubedb-crds`:

```bash
$ helm upgrade -i kubedb-crds ak8sdb/kubedb-crds -n kubedb --create-namespace --version=v2025.5.9
```

The command deploys KubeDB crds on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall the `kubedb-crds`:

```bash
$ helm uninstall kubedb-crds -n kubedb
```

The command removes all the Kubernetes components associated with the chart and deletes the release.


