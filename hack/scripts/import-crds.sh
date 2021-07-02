#!/bin/bash
set -eou pipefail

crd-importer \
--input=$HOME/go/src/kmodules.xyz/custom-resources/crds \
--out=$HOME/go/src/github.com/ak8sdb/installer/charts/kubedb-crds/crds \
--gk=AppBinding.appcatalog.appscode.com

crd-importer \
--input=$HOME/go/src/kubedb.dev/apimachinery/crds \
--out=$HOME/go/src/github.com/ak8sdb/installer/charts/kubedb-crds/crds \
--gk=Elasticsearch.kubedb.com \
--gk=ElasticsearchAutoscaler.autoscaling.kubedb.com \
--gk=ElasticsearchOpsRequest.ops.kubedb.com \
--gk=ElasticsearchVersion.catalog.kubedb.com \
--gk=MongoDB.kubedb.com \
--gk=MongoDBAutoscaler.autoscaling.kubedb.com \
--gk=MongoDBOpsRequest.ops.kubedb.com \
--gk=MongoDBVersion.catalog.kubedb.com

crd-importer \
--input=$HOME/go/src/stash.appscode.dev/apimachinery/crds \
--out=$HOME/go/src/github.com/ak8sdb/installer/charts/kubedb-crds/crds \
--gk=BackupConfiguration.stash.appscode.com \
--gk=BackupSession.stash.appscode.com \
--gk=Function.stash.appscode.com \
--gk=Repository.stash.appscode.com \
--gk=RestoreSession.stash.appscode.com \
--gk=Task.stash.appscode.com


crd-importer \
--input=$HOME/go/src/kmodules.xyz/custom-resources/crds \
--out=. --output-yaml=kubedb-crds.yaml \
--gk=AppBinding.appcatalog.appscode.com \
--input=$HOME/go/src/kubedb.dev/apimachinery/crds \
--gk=Elasticsearch.kubedb.com \
--gk=ElasticsearchAutoscaler.autoscaling.kubedb.com \
--gk=ElasticsearchOpsRequest.ops.kubedb.com \
--gk=ElasticsearchVersion.catalog.kubedb.com \
--gk=MongoDB.kubedb.com \
--gk=MongoDBAutoscaler.autoscaling.kubedb.com \
--gk=MongoDBOpsRequest.ops.kubedb.com \
--gk=MongoDBVersion.catalog.kubedb.com \
--input=$HOME/go/src/stash.appscode.dev/apimachinery/crds \
--gk=BackupConfiguration.stash.appscode.com \
--gk=BackupSession.stash.appscode.com \
--gk=Function.stash.appscode.com \
--gk=Repository.stash.appscode.com \
--gk=RestoreSession.stash.appscode.com \
--gk=Task.stash.appscode.com
