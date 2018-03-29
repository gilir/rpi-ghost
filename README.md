# Ghost - Docker ARM builds for Raspberry PI
[![Docker Stars](https://img.shields.io/docker/stars/gilir/rpi-ghost.svg?maxAge=2592000)](https://hub.docker.com/r/gilir/rpi-ghost/)
[![Docker Pulls](https://img.shields.io/docker/pulls/gilir/rpi-ghost.svg?maxAge=2592000)](https://hub.docker.com/r/gilir/rpi-ghost/)
[![Docker Image](https://images.microbadger.com/badges/image/gilir/rpi-ghost.svg)](https://microbadger.com/images/gilir/rpi-ghost "Get your own image badge on microbadger.com")
[![Version](https://images.microbadger.com/badges/version/gilir/rpi-ghost.svg)](https://microbadger.com/images/gilir/rpi-ghost "Get your own version badge on microbadger.com")


## About Ghost
[Ghost](https://ghost.org/) is a free and open source blogging platform written in JavaScript.

## ARM build, for Raspberry PI
Based on official alpine version of Dockerbuild. See Tags for the versions of Ghost available.

## Features
- Alpine 3.7
- NodeJS 6.9

## How to use

To run this image
```
docker run --name some-ghost -p 2368:2368 -d ghost
```

Or you can use a docker-compose:
```
version: '2'

services:
  ghost:
    image: gilir/rpi-ghost
    container_name: ghost
    ports:
      - "2368:2368"
```
And run it with:
```
docker-compose up -d
```

# Sources
- Gitea: https://gitea.lavergne.online/docker/ghost.git
- Github: https://github.com/gilir/rpi-ghost
