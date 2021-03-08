echo "| ==> Session Port Cleanup:"
echo "| |"
echo "| |"
echo "| =====> Free port: 3000"
fuser -k 3000/tcp
echo "| |"
echo "| =====> Free port: 3001"
fuser -k 3001/tcp
echo "| |"
echo "| =====> Free port: 8080"
fuser -k 8080/tcp
echo "| |"
echo "| =====> Killing Prev sessions of kubectl:"
pkill kubectl -9
echo "| |"
