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


