# eks-terraform


helm install external-dns bitnami/external-dns   --namespace default   --set provider=aws   --set aws.region=us-east-1   --set txtOwnerId=my-cluster   --set serviceAccount.name=dns-sa   --set serviceAccount.create=false
