FROM ubuntu:latest AS builder

WORKDIR /build
COPY . .
RUN apt-get update
RUN apt-get install -y git curl wget sudo && curl -sS https://installer.cloudpanel.io/ce/v2/install.sh -o install.sh; \
echo "3c30168958264ced81ca9b58dbc55b4d28585d9066b9da085f2b130ae91c50f6 install.sh" | \
sha256sum -c && sudo bash install.sh

FROM ubuntu:latest

USER 1000
WORKDIR /build
COPY --from=builder /build -t cloudrack-cloudpanel/agent:latest .
EXPOSE 22 8443
CMD ["npm", "start"]
