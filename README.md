# installer

## Import CRDs

```bash
./hack/scripts/import-crds.sh
```

## How to build

```bash
$ rm -rf kubedb-*.tgz
$ rm -rf charts/kubedb/charts
$ rm -rf charts/kubedb/Chart.lock

$ helm dependency build charts/kubedb
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "kubepack-bundles" chart repository
...Successfully got an update from the "appscode-testing" chart repository
...Successfully got an update from the "bytebuilders-ui" chart repository
...Successfully got an update from the "appscode" chart repository
...Successfully got an update from the "stable" chart repository
Update Complete. ⎈Happy Helming!⎈
Saving 4 charts
Downloading kubedb-catalog from repo https://charts.appscode.com/stable
Downloading kubedb-enterprise from repo https://charts.appscode.com/stable
Downloading kubedb-autoscaler from repo https://charts.appscode.com/stable
Deleting outdated charts

$ helm package charts/kubedb
Successfully packaged chart and saved it to: /home/tamal/go/src/github.com/ak8sdb/installer/kubedb-v0.1.0.tgz
```

## How to install

```bash
$ kubectl version --short
Client Version: v1.17.0
Server Version: v1.20.2

$ helm install kubedb kubedb-one \
  --set kubedb-community.license=path_license_file.txt \
  --set kubedb-enterprise.license=path_license_file.txt \
  --set kubedb-autoscaler.license=path_license_file.txt \
  --set stash-community.license=path_license_file.txt

NAME: kubedb
LAST DEPLOYED: Mon Feb 15 18:10:45 2021
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
Get the KubeDB operator pods by running the following command:

  kubectl --namespace default get pods

$ helm ls
NAME  	NAMESPACE	REVISION	UPDATED                                	STATUS  	CHART        	APP VERSION
kubedb	default  	1       	2021-02-15 18:10:45.177655294 -0800 PST	deployed	kubedb-v0.1.0	v0.1.0

$ kubectl --namespace default get pods
NAME                                        READY   STATUS    RESTARTS   AGE
kubedb-kubedb-autoscaler-66795ddb46-dk2l2   1/1     Running   0          2m11s
kubedb-kubedb-community-5d49946b89-728zm    1/1     Running   0          2m11s
kubedb-kubedb-enterprise-86d599c8c5-7kxj9   1/1     Running   0          2m12s
kubedb-stash-community-59c885bbf7-9thpw     2/2     Running   0          2m11s
```
