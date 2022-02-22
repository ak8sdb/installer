# Stash Catalog

[Stash Catalog](https://github.com/stashed) - Catalog of Stash Addons

## TL;DR;

```console
$ helm repo add ak8sdb https://raw.githubusercontent.com/ak8sdb/installer/master/stable
$ helm repo update
$ helm install stash-catalog ak8sdb/stash-catalog -n kube-system
```

## Introduction

This chart deploys Stash catalog on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.14+

## Installing the Chart

To install the chart with the release name `stash-catalog`:

```console
$ helm install stash-catalog ak8sdb/stash-catalog -n kube-system
```

The command deploys Stash catalog on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `stash-catalog`:

```console
$ helm delete stash-catalog -n kube-system
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `stash-catalog` chart and their default values.

|                Parameter                |                                                              Description                                                               |            Default             |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------|--------------------------------|
| registryFQDN                            | Docker registry fqdn used to pull Stash related images. Set this to use docker registry hosted at ${registryFQDN}/${registry}/${image} | <code>""</code>                |
| image.registry                          | Docker registry used to pull Postgres addon image                                                                                      | <code>stashed</code>           |
| waitTimeout                             | Number of seconds to wait for the database to be ready before backup/restore process.                                                  | <code>300</code>               |
| elasticsearch.enabled                   | If true, deploys Elasticsearch addon                                                                                                   | <code>true</code>              |
| elasticsearch.backup.args               | Arguments to pass to `multielasticdump` command  during backup process                                                                 | <code>""</code>                |
| elasticsearch.restore.args              | Arguments to pass to `multielasticdump` command during restore process                                                                 | <code>""</code>                |
| mariadb.enabled                         | If true, deploys MariaDB addon                                                                                                         | <code>true</code>              |
| mariadb.backup.args                     | Arguments to pass to `mariadbdump` command  during bakcup process                                                                      | <code>"--all-databases"</code> |
| mariadb.restore.args                    | Arguments to pass to `mariadb` command during restore process                                                                          | <code>""</code>                |
| mongodb.enabled                         | If true, deploys MongoDB addon                                                                                                         | <code>true</code>              |
| mongodb.maxConcurrency                  | Maximum concurrency to perform backup or restore tasks                                                                                 | <code>3</code>                 |
| mongodb.backup.args                     | Arguments to pass to `mongodump` command during backup process                                                                         | <code>""</code>                |
| mongodb.restore.args                    | Arguments to pass to `mongorestore` command during restore process                                                                     | <code>""</code>                |
| mysql.enabled                           | If true, deploys MySQL addon                                                                                                           | <code>true</code>              |
| mysql.backup.args                       | Arguments to pass to `mysqldump` command  during bakcup process                                                                        | <code>"--all-databases"</code> |
| mysql.restore.args                      | Arguments to pass to `mysql` command during restore process                                                                            | <code>""</code>                |
| perconaxtradb.enabled                   | If true, deploys Percona XtraDB addon                                                                                                  | <code>true</code>              |
| perconaxtradb.backup.args               | Arguments to pass to `mysqldump` command  during bakcup process                                                                        | <code>"--all-databases"</code> |
| perconaxtradb.backup.socatRetry         | Optional argument sent to backup script                                                                                                | <code>30</code>                |
| perconaxtradb.restore.args              | Arguments to pass to `mysql` command during restore process                                                                            | <code>""</code>                |
| perconaxtradb.restore.targetAppReplicas | Optional argument sent to recovery script                                                                                              | <code>1</code>                 |
| postgres.enabled                        | If true, deploys PostgreSQL addon                                                                                                      | <code>true</code>              |
| postgres.backup.cmd                     | Postgres dump command, can either be: pg_dumpall  or pg_dump                                                                           | <code>"pg_dumpall"</code>      |
| postgres.backup.args                    | Arguments to pass to `backup.cmd` command during backup process                                                                        | <code>""</code>                |
| postgres.restore.args                   | Arguments to pass to `psql` command during restore process                                                                             | <code>""</code>                |
| redis.enabled                           | If true, deploys Redis addon                                                                                                           | <code>true</code>              |
| redis.backup.args                       | Arguments to pass to `redis-dump` command  during bakcup process                                                                       | <code>""</code>                |
| redis.restore.args                      | Arguments to pass to `redis` command during restore process                                                                            | <code>""</code>                |
| nats.enabled                            | If true, deploys NATS addon                                                                                                            | <code>true</code>              |
| nats.backup.args                        | Arguments to pass to `nats str backup` command during backup process                                                                   | <code>""</code>                |
| nats.backup.streams                     | List of streams to backup. Don't set this field if you want to backup all streams.                                                     | <code>""</code>                |
| nats.restore.args                       | Arguments to pass to `nats str restore` command during restore process                                                                 | <code>""</code>                |
| nats.restore.streams                    | List of streams to restore. Don't set this field if you want to restore all the backed up streams.                                     | <code>""</code>                |
| nats.restore.overwrite                  | Specify whether to delete the old stream before restoring from backup.                                                                 | <code>false</code>             |
| etcd.enabled                            | If true, deploys ETCD addon                                                                                                            | <code>true</code>              |
| etcd.backup.args                        | Arguments to pass to `etcdctl save` command during backup process                                                                      | <code>""</code>                |
| etcd.restore.args                       | Arguments to pass to `etcdctl restore` command during restore process                                                                  | <code>""</code>                |
| etcd.restore.initialCluster             | List of the peers used to bootstrap the ETCD cluster                                                                                   | <code>""</code>                |
| etcd.restore.initialClusterToken        | Initial token used for the ETCD cluster                                                                                                | <code>""</code>                |
| etcd.restore.dataDir                    | Directory where the ETCD stores its data for persistence                                                                               | <code>""</code>                |
| etcd.restore.workloadKind               | Kind of the workload used to deploy the ETCD cluster (i.e. StatefulSet)                                                                | <code>""</code>                |
| etcd.restore.workloadName               | Name of the workload used to deploy the ETCD cluster                                                                                   | <code>""</code>                |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example:

```console
$ helm install stash-catalog ak8sdb/stash-catalog -n kube-system --set image.registry=stashed
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while
installing the chart. For example:

```console
$ helm install stash-catalog ak8sdb/stash-catalog -n kube-system --values values.yaml
```