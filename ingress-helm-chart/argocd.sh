argocd login $(kubectl get ingress -A| grep argocd | awk '{print $4}') --username admin --password $(argocd admin initial-password -n argocd | head -1) --insecure --skip-test-tls --grpc-web
sleep 1
for app in backend frontend ; do
argocd app create ${app} --repo https://github.com/pdevops78/eks-deploy-helm --path chart --upsert --dest-server https://kubernetes.default.svc --dest-namespace default.svc --insecure  --grpc-web --values values/${app}.yaml
argocd app sync ${app}
done