# Make sure you are pushing a linux/amd64 image to docker hub
docker tag custom-nginx:latest vbalasu/custom-nginx:latest
docker push vbalasu/custom-nginx:latest
