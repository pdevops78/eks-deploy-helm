if [ "$1" == "install" ]; then
 kubectl create namespace argocd
 kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
 sleep 10

 echo url - https://$(kubectl get ingress -A| grep argocd | awk '{print $4}' | tail -1)
 echo username - admin
 echo password - $(argocd admin initial-password -n argocd | head -1)
fi

if [ "$1" == "jobs" ]; then
   argocd login $(kubectl get ingress -A| grep argocd | awk '{print $4}') --username admin --password $(argocd admin initial-password -n argocd | head -1) --insecure --skip-test-tls --grpc-web
    for app in backend frontend ; do
    argocd app create ${app} --repo https://github.com/pdevops78/eks-deploy-helm --path chart --upsert --dest-server https://kubernetes.default.svc --dest-namespace default.svc --insecure  --grpc-web --values values/${app}.yaml
    done
fi

# to install elk
helm repo add elastic https://helm.elastic.co && helm repo update
kubectl apply -f https://download.elastic.co/downloads/eck/3.1.0/crds.yaml
kubectl apply -f https://download.elastic.co/downloads/eck/3.1.0/operator.yaml
helm install es-kb-quickstart elastic/eck-stack -n elastic-stack --create-namespace



