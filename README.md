# installer

## How to install

```bash
$ helm repo add ak8sdb https://raw.githubusercontent.com/ak8sdb/installer/master/stable
$ helm repo update

$ helm search repo kubedb
NAME                                CHART VERSION APP VERSION DESCRIPTION
ak8sdb/kubedb                       v2025.5.9     v2025.5.9   KubeDB by AppsCode - Production ready databases...
ak8sdb/kubedb-autoscaler            v2025.5.9     v2025.5.9   KubeDB Autoscaler by AppsCode - Autoscale KubeD...
ak8sdb/kubedb-catalog               v2025.5.9     v2025.5.9   KubeDB Catalog by AppsCode - Catalog for databa...
ak8sdb/kubedb-community             v2025.5.9     v2025.5.9   KubeDB Community by AppsCode - Community featur...
ak8sdb/kubedb-crds                  v2025.5.9     v2025.5.9   KubeDB and Stash crds
ak8sdb/kubedb-enterprise            v2025.5.9     v2025.5.9   KubeDB Enterprise by AppsCode - Enterprise feat...

# enable both Elasticsearch and MongoDB
$ helm upgrade -i kubedb ak8sdb/kubedb \
  --set-file global.license=/path/to/license.txt

# enable only Elasticsearch
$ helm upgrade -i kubedb ak8sdb/kubedb \
  --set global.featureGates.Elasticsearch=true \
  --set global.featureGates.MongoDB=false \
  --set-file global.license=/path/to/license.txt

# enable only MongoDB
$ helm upgrade -i kubedb ak8sdb/kubedb \
  --set global.featureGates.Elasticsearch=false \
  --set global.featureGates.MongoDB=true \
  --set-file global.license=/path/to/license.txt

$ helm ls
NAME  	NAMESPACE	REVISION	UPDATED                                	STATUS  	CHART             	APP VERSION
kubedb	default  	1       	2021-03-21 18:09:41.707580398 -0700 PDT	deployed	kubedb-v2025.5.9	v2025.5.9

$ kubectl get pods
NAME                                        READY   STATUS    RESTARTS   AGE
kubedb-kubedb-autoscaler-c47888f7-lnv7c     1/1     Running   0          2m6s
kubedb-kubedb-community-68d767957b-flgmz    1/1     Running   0          2m6s
kubedb-kubedb-enterprise-556868cfd8-hzckm   1/1     Running   0          2m6s
kubedb-stash-community-688658484b-w5dpd     2/2     Running   0          2m6s
```

## Import CRDs

```bash
./hack/scripts/import-crds.sh
```

## Update Helm Chart Repository

```bash
make update-charts
helm dependency build charts/kubedb
./hack/scripts/update-repo.sh
```

## Development

```bash
helm dependency update charts/kubedb

helm upgrade -i kubedb charts/kubedb \
  --set global.featureGates.Elasticsearch=true \
  --set global.featureGates.MongoDB=false \
  --set-file global.license=/path/to/license.txt

watch kubectl get crds,pods
```