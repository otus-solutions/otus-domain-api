# API - BUILD IMAGE
sudo docker build --target api -t otus-domain-api .

# API - BUILD CONTAINER
sudo docker run -v $(pwd)/persistence:/opt/wildfly/standalone/log --network=otus-platform-network -p 51006:8080 -p 51008:9990 --name otus-domain-api otus-domain-api
