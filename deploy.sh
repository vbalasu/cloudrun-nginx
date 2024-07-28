# Before you deploy to Google Cloud Run, please make sure that the container image is using linux/amd64 architecture
# arm64 will not work on Cloud Run!
gcloud run deploy custom-nginx-service \
--image=docker.io/vbalasu/custom-nginx:latest \
--platform=managed \
--region=us-central1 \
--allow-unauthenticated \
--port=8080

