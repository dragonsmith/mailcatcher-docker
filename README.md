# Mailcatcher

[![Docker Repository on Quay](https://quay.io/repository/evl.ms/mailcatcher/status "Docker Repository on Quay")](https://quay.io/repository/evl.ms/mailcatcher)

## Description

Mailcatcher docker image prepared for K8s use.

See [Dockerfile](https://github.com/dragonsmith/mailcatcher-docker/blob/master/Dockerfile) for more info.

There is also the [Helm](https://helm.sh) chart here to install this image using `helm` cmd.

## How to use plain docker image

Nothing special:

```shell
docker run --rm --name mailcatcher -p 127.0.0.1:1080:1080 -p 127.0.0.1:1025:1025 quay.io/evl.ms/mailcatcher:0.7.0
```

## How to install it into K8s

```shell
git clone https://github.com/dragonsmith/mailcatcher-docker/
cd mailcatcher-docker
helm install -n mailcatcher --namespace mailcatcher chart/mailcatcher/
```

See `values-example.yaml`.

## Sponsor

[![Sponsored by Evil Martians](https://evilmartians.com/badges/sponsored-by-evil-martians.png)](https://evilmartians.com)
