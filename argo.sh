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




 kubectl patch storageclass gp2 -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
 kubectl get secret elasticsearch-es-elastic-user -n elastic-stack \
  -o go-template='{{.data.elastic | base64decode}}'
kubectl get secrets elasticsearch-es-elastic-user -n elastic-stack -o json | jq '.data.elastic' | sed -e 's/"//g' | base64 --decode





