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




7432  20/09/25 04:14:12 kubectl get pvc -elastic-stack
7433  20/09/25 04:14:18 kubectl get pvc -n elastic-stack
7434  20/09/25 04:14:29 kubectl describe pvc elasticsearch-data-elasticsearch-es-default-0
7435  20/09/25 04:14:37 kubectl describe pvc elasticsearch-data-elasticsearch-es-default-0 -A
7436  20/09/25 04:15:07 kubectl get pods --all-namespaces | grep elasticsearch
7437  20/09/25 04:15:27 kubectl describe pvc elasticsearch-data-elasticsearch-es-default-0 -n elasticsearch
7438  20/09/25 04:15:35 kubectl describe pvc elasticsearch-data-elasticsearch-es-default-0 -n elastic-stack
7439  20/09/25 04:16:27  kubectl get pods --all-namespaces
7440  20/09/25 04:17:26 vi 01-pvc.yaml
7441  20/09/25 04:18:12 kubectl apply -f 01-pvc.yaml
7442  20/09/25 04:18:18 kubectl get pods -A
7443  20/09/25 04:18:46 kubectl  kubectl describe pvc elasticsearch-data-elasticsearch-es-default-0 -n elastic-stack
7444  20/09/25 04:18:53 kubectl get storageclass
7445  20/09/25 04:19:42 vi 01-pvc.yaml
7446  20/09/25 04:20:03 kubectl apply -f 01-pvc.yaml
7447  20/09/25 04:20:15 kubectl delete pod 01-pvc.yaml
7448  20/09/25 04:20:28 vi 01-pvc.yaml
7449  20/09/25 04:20:40 kubectl delete pod elasticsearch-data
7450  20/09/25 04:20:51 kubectl get pod -A
7451  20/09/25 04:21:08 cat 01-pvc.yaml
7452  20/09/25 04:21:23 kubectl get pod elasticsearch-data
7453  20/09/25 04:21:42 kubectl get pvc
7454  20/09/25 04:21:46 kubectl get pvc -A
7455  20/09/25 04:21:57 kubectl delete pvc elasticsearch-data
7456  20/09/25 04:22:04 kubectl delete pvc elasticsearch-data -n elastic-stack
7457  20/09/25 04:22:13 kubectl apply -f 01-pvc.yaml
7458  20/09/25 04:22:21 kubectl get pvc -A
7459  20/09/25 04:22:32 kubectl get storagclass
7460  20/09/25 04:22:39 kubectl get storageclass
7461  20/09/25 04:23:05 kubectl patch storageclass gp2   -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
7462  20/09/25 04:23:10 kubectl get storageclass
7463  20/09/25 04:23:41 kubectl get pods -A
7464  20/09/25 04:23:51 kubectl delete pod pod-identity-test
7465  20/09/25 04:24:02 kubectl apply -f 01-pod.yaml
7466  20/09/25 04:24:07 kubectl get pods -A
7467  20/09/25 04:24:16 kubectl get storageclass
7468  20/09/25 04:24:25 kubectl patch storageclass gp2   -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
7469  20/09/25 04:24:29 kubectl get storageclass
7470  20/09/25 04:25:37 kubectl delete pod elasticsearch-es-default-0 -n elastic-stack
7471  20/09/25 04:25:43 kubectl get pods -A
7472  20/09/25 04:26:04 kubectl describe pod elasticsearch-es-default-0
7473  20/09/25 04:26:11 kubectl describe pod elasticsearch-es-default-0 -n elastic-stack
7474  20/09/25 04:28:26 kubectl get pods -A
7475  20/09/25 04:28:39 kubectl get pvc
7476  20/09/25 04:28:43 kubectl get pvc -A
7477  20/09/25 04:29:45 kubectl delete pvc elasticsearch-data -n elastic-stack
7478  20/09/25 04:29:49 kubectl get pvc -A
7479  20/09/25 04:30:28 ls -l
7480  20/09/25 04:30:37 cat pvc-01.yaml
7481  20/09/25 04:31:28 kubectl get pvc -A
7482  20/09/25 04:31:52 kubectl get storageclass
7483  20/09/25 04:33:24 kubectl logs elasticsearch-es-default-0 -n elastic-stack
7484  20/09/25 04:33:49 kubectl get pvc -A
7485  20/09/25 04:41:10 git pull
7486  20/09/25 04:41:17 cd
7487  20/09/25 04:41:28 rm -rf learn-kubernetes
7488  20/09/25 04:41:30 ls -l
7489  20/09/25 04:41:43 git clone https://github.com/pdevops78/learn-kubernetes
7490  20/09/25 04:41:46 ls -l
7491  20/09/25 04:41:50 cd learn-kubernetes
7492  20/09/25 04:41:52 git pull
7493  20/09/25 04:42:11 terraform apply -var-file=env-dev/main.tfvars -auto-approve
7494  20/09/25 04:42:20 terraform init
7495  20/09/25 04:42:36 terraform init -backend-config=env-dev/state.tfvars
7496  20/09/25 04:43:04 terraform apply -var-file=env-dev/main.tfvars -auto-approve
7497  20/09/25 04:47:24 terraform init -upgrade=false
7498  20/09/25 04:47:38 terraform apply -var-file=env-dev/main.tfvars -auto-approve
7499  20/09/25 04:48:02 terraform providers
7500  20/09/25 04:49:02 git pull
7501  20/09/25 04:50:05 terraform init -upgrade=false
7502  20/09/25 04:50:14 git pull
7503  20/09/25 04:50:17 terraform init -upgrade=false
7504  20/09/25 04:50:35 terraform init -var-file=env-dev/state.tfvars
7505  20/09/25 04:50:59 terraform init -upgrade
7506  20/09/25 04:51:14 terraform apply -var-file=env-dev/main.tfvars -auto-approve
7507  20/09/25 04:55:10 git pull
7508  20/09/25 04:55:14 terraform apply -var-file=env-dev/main.tfvars -auto-approve
7509  20/09/25 04:55:22 git pull
7510  20/09/25 04:57:23 terraform apply -var-file=env-dev/main.tfvars -auto-approve
7511  20/09/25 05:01:20 kubectl get pvc -A
7512  20/09/25 05:01:32 kubectl get pods -A
7513  20/09/25 05:01:52 kubectl delete pvc elasticsearch-es-default-0 -n elastic-stack
7514  20/09/25 05:01:59 kubectl get pods -A
7515  20/09/25 05:02:17 kubectl delete pvc elasticsearch-es-default-0 -n elastic-stack
7516  20/09/25 05:02:29 kubectl get pvc -A
7517  20/09/25 05:03:02 kubectl delete pvc elasticsearch-data-elasticsearch-es-default-0 -n elastic-stack
7518  20/09/25 05:04:05 kubectl get pvc -A
7519  20/09/25 05:04:19 kubectl get pods -A
7520  20/09/25 05:04:40 terraform destroy -var-file=env-dev/main.tfvars -auto-approve
7521  20/09/25 15:34:13 ls -l
7522  20/09/25 15:34:16 cd learn-kubernetes
7523  20/09/25 15:34:21 git pull
7524  20/09/25 15:34:40 terraform init -backend-config=env-dev/state.tfvars
7525  20/09/25 15:35:05 terraform apply-var-file=env-dev/main.tfvars -auto-approve
7526  20/09/25 15:45:58 kubectl get nodes
7527  20/09/25 15:46:07 ls -l
7528  20/09/25 15:46:10 cd learn-kubernetes
7529  20/09/25 15:46:18 kubectl get pvc
7530  20/09/25 15:46:22 kubectl get pvc -A
7531  20/09/25 15:48:56 kubectl get serviceaccount -A
7532  20/09/25 15:49:15 kubectl get serviceaccount ebs-csi-controller-sa -n kube-system
7533  20/09/25 15:49:28 kubectl apply -f 01-pod.yaml
7534* 20/09/25 15:49:55 kubectl create serviceaccount ebs-csi-controller-sa
7535  20/09/25 15:50:25 kubectl apply -f 01-pod.yaml -n ebs-csi-controller-sa
7536  20/09/25 15:50:57 kubectl apply -f 01-pod.yaml
7537  20/09/25 15:52:17 kubectl apply -f 01-sa.yaml
7538  20/09/25 15:52:51 kubectl get serviceaccount -n ebs-csi-controller-sa
7539  20/09/25 15:53:19 kubectl get serviceaccount -n kube-system
7540  20/09/25 15:53:33 kubectl get serviceaccount ebs-csi-controller-sa -n kube-system
7541  20/09/25 15:53:48 kubectl get serviceaccount ebs-csi-controller-sa
7542  20/09/25 15:53:54 kubectl get serviceaccount ebs-csi-controller-sa -n default
7543  20/09/25 15:55:16 vi 01-sa.yaml
7544  20/09/25 15:56:09 kubectl apply -f 01-sa.yaml
7545  20/09/25 15:56:54 kubectl delete serviceaccount ebs-csi-controller-sa
7546  20/09/25 15:57:02 kubectl delete serviceaccount ebs-csi-controller-sa -n kube-system
7547  20/09/25 15:57:07 kubectl apply -f 01-sa.yaml
7548  20/09/25 15:57:19 kubectl apply -f 01-pod.yaml
7549  20/09/25 15:57:40 vi 01-pod.yaml
7550  20/09/25 15:58:25 kubectl apply -f 01-pod.yaml
7551  20/09/25 15:58:37 kubectl get pods -A
7552  20/09/25 15:58:47 kubectl logs pod-identity-test
7553  20/09/25 15:58:56 kubectl logs pod-identity-test -n kube-system
7554  20/09/25 15:59:43 helm repo add elastic https://helm.elastic.co && helm repo update
7555  20/09/25 15:59:52 kubectl apply -f https://download.elastic.co/downloads/eck/3.1.0/crds.yaml
7556  20/09/25 15:59:59 kubectl apply -f https://download.elastic.co/downloads/eck/3.1.0/operator.yaml
7557  20/09/25 16:00:06 helm install es-kb-quickstart elastic/eck-stack -n elastic-stack --create-namespace
7558  20/09/25 16:00:16 kubectl get pods -A
7559  20/09/25 16:00:33 kubectl get pvc -A
7560  20/09/25 16:00:49 kubectl describe pvc elasticsearch-data-elasticsearch-es-default-0 -n elastic-stack
7561  20/09/25 16:01:04 kubectl apply -f 01-pvc.yaml
7562  20/09/25 16:01:10 kubectl describe pvc elasticsearch-data-elasticsearch-es-default-0 -n elastic-stack
7563  20/09/25 16:01:31 kubectl logs pvc elasticsearch-data-elasticsearch-es-default-0 -n elastic-stack
7564  20/09/25 16:01:43 kubectl logs  elasticsearch-data-elasticsearch-es-default-0 -n elastic-stack
7565  20/09/25 16:01:48 history
