# cloudrun-nginx

This is a demonstration of how to serve a custom docker container (nginx) on Google Cloud Run using your own custom domain

This example is running at: 
https://custom-nginx.cloudmatica.com
https://custom-nginx.vbalasu.com

Here are the high level steps:

1. Install docker on your local machine. If you are using a Mac with Apple Silicon (eg. M1 or M2), pay attention to the architecture of your containers (amd64 or arm64)
2. Pull the nginx:latest container
3. Create a `Dockerfile` that uses this container as a starting point, and customizes `index.html` and `nginx.conf`. Ensure that your `nginx.conf` in the container uses port 8080 (this is expected by Google Cloud Run)
4. Use `docker build` to create the custom-nginx container and test it locally
5. If it is working locally, use `docker buildx` to build a container using the amd64 architecture and use the --push flag to push it to Docker Hub
6. If you have access to an AMD64 Linux machine with docker, run a container using this image to make sure it is working properly
7. If successful, deploy to Google Cloud Run. This creates a service that is based on the container image on Docker Hub. Note that this avoids the additional step of deploying to Google's container registry
8. Google Cloud Run provides a URL where the deployed service is available. Test to make sure it is working properly
9. In your Google Cloud Run service, choose "Configure custom domains" and add a Domain Mapping
10. You will need to choose a verified domain. If not already verified, complete the DNS verification steps to verify your domain. This involves adding TXT records to your DNS hosted zone. This may be on a different cloud provider (eg. AWS Route 53)
11. In your DNS hosted zone, add a CNAME entry for a subdomain that points to the URL provided by Google Cloud Run (eg. ghs.googlehosted.com.)
12. Wait for DNS propagation. This will typically take 20 minutes, but can take up to 24 hours

