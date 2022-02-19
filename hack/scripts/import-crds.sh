#!/bin/bash
set -eou pipefail

crd-importer \
    --input=https://raw.githubusercontent.com/kmodules/custom-resources/3bf3dbd8ac52976bebfe47e91c675ecd4da3b3a3/crds/appcatalog.appscode.com_appbindings.yaml \
    --out=$HOME/go/src/github.com/ak8sdb/installer/charts/kubedb-crds/crds \
    --gk=AppBinding.appcatalog.appscode.com

crd-importer \
    --input=$HOME/go/src/github.com/ak8sdb/kubedb-apimachinery/crds \
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
    --input=$HOME/go/src/github.com/ak8sdb/stash-apimachinery/crds \
    --out=$HOME/go/src/github.com/ak8sdb/installer/charts/kubedb-crds/crds \
    --gk=BackupConfiguration.stash.appscode.com \
    --gk=BackupSession.stash.appscode.com \
    --gk=Function.stash.appscode.com \
    --gk=Repository.stash.appscode.com \
    --gk=RestoreSession.stash.appscode.com \
    --gk=Task.stash.appscode.com

crd-importer \
    --input=https://raw.githubusercontent.com/kmodules/custom-resources/3bf3dbd8ac52976bebfe47e91c675ecd4da3b3a3/crds/appcatalog.appscode.com_appbindings.yaml \
    --out=. --output-yaml=kubedb-crds.yaml \
    --gk=AppBinding.appcatalog.appscode.com \
    --input=$HOME/go/src/github.com/ak8sdb/kubedb-apimachinery/crds \
    --gk=Elasticsearch.kubedb.com \
    --gk=ElasticsearchAutoscaler.autoscaling.kubedb.com \
    --gk=ElasticsearchOpsRequest.ops.kubedb.com \
    --gk=ElasticsearchVersion.catalog.kubedb.com \
    --gk=MongoDB.kubedb.com \
    --gk=MongoDBAutoscaler.autoscaling.kubedb.com \
    --gk=MongoDBOpsRequest.ops.kubedb.com \
    --gk=MongoDBVersion.catalog.kubedb.com \
    --input=$HOME/go/src/github.com/ak8sdb/stash-apimachinery/crds \
    --gk=BackupConfiguration.stash.appscode.com \
    --gk=BackupSession.stash.appscode.com \
    --gk=Function.stash.appscode.com \
    --gk=Repository.stash.appscode.com \
    --gk=RestoreSession.stash.appscode.com \
    --gk=Task.stash.appscode.com
