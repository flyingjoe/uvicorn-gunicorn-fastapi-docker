#!/usr/bin/env bash

set -e

use_tag="$REPO:$NAME"
use_dated_tag="${use_tag}-$(date -I)"
DOCKERFILE="$NAME"

bash scripts/docker-login.sh

if [ "$NAME" == "latest" ] ; then
    DOCKERFILE="python3.8"
fi

docker buildx build \
    --platform inux/amd64,linux/arm64,linux/arm32v6,linux/arm32v7,linux/arm64v8 \
    -t "$use_tag" docker-images/ \
    -f docker-images/$DOCKERFILE.dockerfile \
    --push
