# installer

## How to install

```bash
$ helm repo add ak8sdb https://raw.githubusercontent.com/ak8sdb/installer/master/stable
$ helm repo update

$ helm search repo kubedb
NAME                      	CHART VERSION	APP VERSION 	DESCRIPTION
ak8sdb/kubedb             	v2021.12.07  	v2021.12.07 	KubeDB by AppsCode - Production ready databases...
ak8sdb/kubedb-crds        	v2021.12.07  	v2021.12.07 	KubeDB and Stash crds

$ helm install kubedb ak8sdb/kubedb \
  --set-file global.license=/path/to/license.txt

NAME: kubedb
LAST DEPLOYED: Sun Mar 21 18:09:41 2021
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
Get the KubeDB operator pods by running the following command:

  kubectl --namespace default get pods

$ helm ls
NAME  	NAMESPACE	REVISION	UPDATED                                	STATUS  	CHART             	APP VERSION
kubedb	default  	1       	2021-03-21 18:09:41.707580398 -0700 PDT	deployed	kubedb-v2021.12.07	v2021.12.07

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
./hack/scripts/update-repo.sh
```
