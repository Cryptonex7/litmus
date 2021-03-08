echo ""
echo "=================="
echo "   FRONTEND INIT"
echo "=================="
echo ""

cd ./frontend
echo " ==> Installing NPM packages:"
echo ""

npm i

echo " ==> Starting Development Server:"
echo ""
trap "fuser -k 3001/tcp" SIGINT
PORT=3001 npm start
