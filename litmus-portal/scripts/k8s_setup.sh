echo ""
echo "=================="
echo "=================="
echo ""

echo " ==> Deleting Minikube:"
minikube delete

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
