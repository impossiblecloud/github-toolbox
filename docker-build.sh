#!/bin/bash

IMAGE="adgit/github-toolbox"
TAG="20250821-v1"

docker buildx build \
  --no-cache \
  --push \
  --builder multi-platform-builder \
  --platform linux/arm64,linux/amd64 \
  --tag ${IMAGE}:${TAG} .
