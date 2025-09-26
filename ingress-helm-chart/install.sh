helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
# service for nlb
helm upgrade --install ngx-ingres ingress-nginx/ingress-nginx -f ingress.yaml
kubectl create namespace  argocd
kubectl apply -f argocd-ingress-dev.yaml -n argocd

#while [ true ]; do
#  lb=$(kubectl get ingress -A | grep argocd | awk '{print $4}')
#  nslookup "$lb"
#  if [ $? -eq 0 ]; then
#     echo "$lb is created"
#     break;
#  else
#    echo "$lb not created"
#    sleep 2
#  fi
#done

# to install elk
helm repo add elastic https://helm.elastic.co && helm repo update
kubectl apply -f https://download.elastic.co/downloads/eck/3.1.0/crds.yaml
kubectl apply -f https://download.elastic.co/downloads/eck/3.1.0/operator.yaml
helm install es-kb-quickstart elastic/eck-stack -n elastic-stack --create-namespace
sleep 1
# to expose kibana ui
kubectl apply -f kibana-ingress.yaml -n elastic-stack
echo username - admin
echo password - $(argocd admin initial-password -n argocd | head -1)
sleep 1

eck_password=$(kubectl get secrets elasticsearch-es-elastic-user -n elastic-stack -o json | jq '.data.elastic' | sed -e 's/"//g' | base64 --decode)
sleep 1
echo "eck - username / password : elastic / $eck_password"

argocd login $(kubectl get ingress -A| grep argocd | awk '{print $4}') --username admin --password $(argocd admin initial-password -n argocd | head -1) --insecure --skip-test-tls --grpc-web
sleep 1
for app in backend frontend ; do
argocd app create ${app} --repo https://github.com/pdevops78/eks-deploy-helm --path chart --upsert --dest-server https://kubernetes.default.svc --dest-namespace default.svc --insecure  --grpc-web --values values/${app}.yaml
argocd app sync ${app}
done



