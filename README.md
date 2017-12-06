# docker-lsyncd
lsyncd for docker

### use docker command
docker run -it -v /xmisp/docker/bind/conf/:/data -v /root/.ssh/:/root/.ssh/ --name lsyncd davinbao/lsyncd

### use docker compose

version: '3.3'
services:
  bind:
    image: davinbao/lsyncd:latest
    deploy:
      replicas: 1
      endpoint_mode: vip
      resources:
        limits:
          memory: 512M
    volumes:
    - /xmisp/docker/bind/conf/:/data
    - /root/.ssh:/root/.ssh:ro
    networks:
      - backend