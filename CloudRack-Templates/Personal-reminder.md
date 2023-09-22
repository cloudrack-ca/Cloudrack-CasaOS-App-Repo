## 1. 🛳&nbsp;&nbsp;Containerizing the app using Docker

1\. Let's start by cloning BTC RPC Explorer on our system:

```sh
git clone --branch v2.0.2 https://github.com/janoside/btc-rpc-explorer.git
cd  btc-rpc-explorer
```

2\. Next, we'll create a `Dockerfile` in the app's directory:

```Dockerfile
FROM node:12-buster-slim AS builder

WORKDIR /build
COPY . .
RUN apt-get update
RUN apt-get install -y git python3 build-essential
RUN npm ci --production

FROM node:12-buster-slim

USER 1000
WORKDIR /build
COPY --from=builder /build .
EXPOSE 3002
CMD ["npm", "start"]
```

### A good Dockerfile:

- [x] Uses `debian:buster-slim` (or its derivatives, like `node:12-buster-slim`) as the base image — resulting in less storage consumption and faster app installs as the base image is already cached on the user's Umbrel.
- [x] Uses [multi-stage builds](https://docs.docker.com/develop/develop-images/multistage-build/) for smaller image size.
- [x] Ensures development files are not included in the final image.
- [x] Has only one service per container.
- [x] Doesn't run the service as root.
- [x] Uses remote assets that are verified against a checksum.
- [x] Results in deterministic image builds.

3\. We're now ready to build the Docker image of BTC RPC Explorer. Umbrel supports both 64-bit ARM and x86 architectures, so we'll use `docker buildx` to build, tag, and push multi-architecture Docker images of our app to Docker Hub.

```sh
docker buildx build --platform linux/arm64,linux/amd64 --tag getumbrel/btc-rpc-explorer:v2.0.2 --output "type=registry" .
```
