echo ""
echo "=================="
echo "=================="
echo ""

echo " ==> Starting Minikube:"
minikube start

echo ""
echo "=================="
echo "=================="
echo ""

echo " ==> Applying Manifest:"
echo "$ kubectl apply -f https://raw.githubusercontent.com/litmuschaos/litmus/master/litmus-portal/cluster-k8s-manifest.yml"
kubectl apply -f https://raw.githubusercontent.com/litmuschaos/litmus/master/litmus-portal/cluster-k8s-manifest.yml

echo ""
echo "=================="
echo "=================="
echo ""

PODOUTPUT=$(kubectl get pods -n litmus | grep mongo)

echo "PodOutput: $PODOUTPUT"

for value in $PODOUTPUT; do
  MONGOPODID=$value
  break
done

echo ""
echo "MongoPodID: $MONGOPODID"

echo ""
echo "=================="
echo "=================="
echo ""

kubectl port-forward $MONGOPODID -n litmus 27017:27017
