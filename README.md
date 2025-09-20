# eks-terraform


helm install external-dns bitnami/external-dns   --namespace default   --set provider=aws   --set aws.region=us-east-1   --set txtOwnerId=my-cluster   --set serviceAccount.name=dns-sa   --set serviceAccount.create=false


NAME: external-dns
LAST DEPLOYED: Fri Sep 12 17:08:12 2025
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
CHART NAME: external-dns
CHART VERSION: 9.0.3
APP VERSION: 0.18.0


helm upgrade -i frontend ./chart -f ./chart/values/frontend.yaml
You must make sure the Ingress and the target Service are in the same namespace. Kubernetes Ingress does not support cross-namespace routing.


aws-ebs-csi-driver : add-on name
ebs-csi-controller-sa: service account
v1.48.0-eksbuild.2

es-kb-quickstart-eck-kibana-kb-http
5601


│ Error: could not download chart: Chart.yaml file is missing
│
│   with module.eks.helm_release.external-dns,
│   on module/eks/external-dns.tf line 1, in resource "helm_release" "external-dns":
│    1: resource "helm_release" "external-dns" {
│




kubectl describe pvc elasticsearch-data-elasticsearch-es-default-0 -n elastic-stack
Name:          elasticsearch-data-elasticsearch-es-default-0
Namespace:     elastic-stack
StorageClass:  ebs-sc
Status:        Pending
Volume:
Labels:        common.k8s.elastic.co/type=elasticsearch
elasticsearch.k8s.elastic.co/cluster-name=elasticsearch
elasticsearch.k8s.elastic.co/statefulset-name=elasticsearch-es-default
Annotations:   volume.beta.kubernetes.io/storage-provisioner: ebs.csi.aws.com
volume.kubernetes.io/selected-node: ip-10-0-0-125.ec2.internal
volume.kubernetes.io/storage-provisioner: ebs.csi.aws.com
Finalizers:    [kubernetes.io/pvc-protection]
Capacity:
Access Modes:
VolumeMode:    Filesystem
Used By:       elasticsearch-es-default-0
Events:
Type     Reason                Age               From                                                                                      Message
  ----     ------                ----              ----                                                                                      -------
Normal   WaitForFirstConsumer  34s               persistentvolume-controller                                                               waiting for first consumer to be created before binding
Warning  ProvisioningFailed    9s (x3 over 29s)  ebs.csi.aws.com_ebs-csi-controller-6b9fb9b668-86l8b_6f33a646-5a6f-430c-a01c-0dc63c117577  failed to provision volume with StorageClass "ebs-sc": rpc error: code = Internal desc = Could not create volume "pvc-7587ebd1-3200-4c86-8836-980887cbe7bf": could not create volume in EC2: operation error EC2: CreateVolume, get identity: get credentials: failed to refresh cached credentials, no EC2 IMDS role found, operation error ec2imds: GetMetadata, canceled, context deadline exceeded
Normal   Provisioning          6s (x6 over 34s)  ebs.csi.aws.com_ebs-csi-controller-6b9fb9b668-86l8b_6f33a646-5a6f-430c-a01c-0dc63c117577  External provisioner is provisioning volume for claim "elastic-stack/elasticsearch-data-elasticsearch-es-default-0"
Normal   ExternalProvisioning  3s (x6 over 34s)  persistentvolume-controller                                                               Waiting for a volume to be created either by the external provisioner 'ebs.csi.aws.com' or manually by the system administrator. If volume creation is delayed, please verify that the provisioner is running and correctly registered.
Warning  ProvisioningFailed    1s (x3 over 24s)  ebs.csi.aws.com_ebs-csi-controller-6b9fb9b668-86l8b_6f33a646-5a6f-430c-a01c-0dc63c117577  failed to provision volume with StorageClass "ebs-sc": rpc error: code = Internal desc = Could not create volume "pvc-7587ebd1-3200-4c86-8836-980887cbe7bf": could not create volume in EC2: operation error EC2: CreateVolume, get identity: get credentials: failed to refresh cached credentials, no EC2 IMDS role found, operation error ec2imds: GetMetadata, request canceled, context deadline exceeded

98.83.155.2 | 172.31.39.155 | t3.medium | https://github.com/pdevops78/eks-deploy-helm



nstall external dns:
=====================
** helm repo add bitnami https://charts.bitnami.com/bitnami
** helm repo add external-dns https://kubernetes-sigs.github.io/external-dns/
2541  02/09/25 09:48:24
helm search repo external-dns --versions | grep 1.17.0
** helm install external-dns bitnami/external-dns   --namespace default   --set provider=aws   --set aws.region=us-east-1   --set txtOwnerId=my-cluster   --set serviceAccount.name=dns-sa   --set serviceAccount.create=false


** autoscaling group
====================
helm repo add autoscaler https://kubernetes.github.io/autoscaler
helm repo update
helm install my-release autoscaler/cluster-autoscaler
--set 'autoDiscovery.clusterName'=<CLUSTER NAME>

