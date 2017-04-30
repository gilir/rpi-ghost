# Ghost - ARM builds for Raspberry PI
[![Docker Stars](https://img.shields.io/docker/stars/gilir/rpi-ghost.svg?maxAge=2592000)](https://hub.docker.com/r/gilir/rpi-ghost/)
[![Docker Pulls](https://img.shields.io/docker/pulls/gilir/rpi-ghost.svg?maxAge=2592000)](https://hub.docker.com/r/gilir/rpi-ghost/)
[![Docker Image Size] (https://img.shields.io/imagelayers/image-size/gilir/rpi-ghost.svg?maxAge=2592000)](https://hub.docker.com/r/gilir/rpi-ghost/)
[![Docker Layers] (https://img.shields.io/imagelayers/layers/gilir/rpi-ghost.svg?maxAge=2592000)](https://hub.docker.com/r/gilir/rpi-ghost/)

## About Ghost
Ghost is a free and open source blogging platform written in JavaScript.

## ARM build, for Rapsberry PI
Based on official alpine version of Dockerbuild. See Tags for the version of Ghost available.

## Features
- Alpine 3.5
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
