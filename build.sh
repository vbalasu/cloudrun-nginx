docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker buildx create --use
docker buildx inspect --bootstrap
docker buildx build --platform linux/amd64 -t vbalasu/custom-nginx:latest --push .

