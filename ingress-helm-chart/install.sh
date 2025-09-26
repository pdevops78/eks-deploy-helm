helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
# service for nlb
helm upgrade --install ngx-ingres ingress-nginx/ingress-nginx -f ingress.yaml
kubectl create namespace  argocd
kubectl apply -f argocd-ingress-dev.yaml -n argocd

LOAD_BALANCER=$(kubectl get svc ngx-ingres-ingress-nginx-controller | grep ngx-ingres-ingress-nginx-controller | awk '{print $4}')

while true ; do
  echo "Waiting for Load Balancer to come to Active"
  nslookup $LOAD_BALANCER &>/dev/null
  if [ $? -eq 0 ]; then break ; fi
  sleep 5
done


# to install elk
helm repo add elastic https://helm.elastic.co && helm repo update
kubectl apply -f https://download.elastic.co/downloads/eck/3.1.0/crds.yaml
kubectl apply -f https://download.elastic.co/downloads/eck/3.1.0/operator.yaml
helm install es-kb-quickstart elastic/eck-stack -n elastic-stack --create-namespace
kubectl patch storageclass gp2 -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
sleep 1
# to expose kibana ui
kubectl apply -f kibana-ingress.yaml -n elastic-stack
echo username - admin
echo password - $(argocd admin initial-password -n argocd | head -1)
sleep 1

ES_PASSWORD=$(kubectl get secrets elasticsearch-es-elastic-user -n elastic-stack -o json | jq '.data.elastic' | sed -e 's/"//g' | base64 --decode)
sed -e "s/ES_PASSWORD/${ES_PASSWORD}/" logstash.yaml >/tmp/logstash.yaml
kubectl apply -f /tmp/logstash.yaml
kubectl apply -f filebeat.yaml
echo "eck - username / password : elastic / $(kubectl get secrets elasticsearch-es-elastic-user -n elastic-stack -o json | jq '.data.elastic' | sed -e 's/"//g' | base64 --decode)"

argocd login $(kubectl get ingress -A| grep argocd | awk '{print $4}') --username admin --password $(argocd admin initial-password -n argocd | head -1) --insecure --skip-test-tls --grpc-web
sleep 1
for app in backend frontend ; do
argocd app create ${app} --repo https://github.com/pdevops78/eks-deploy-helm --path chart --upsert --dest-server https://kubernetes.default.svc --dest-namespace default.svc --insecure  --grpc-web --values values/${app}.yaml
argocd app sync ${app}
done



