#!/usr/bin/env bash

set -e

use_tag="$REPO:$NAME"
use_dated_tag="${use_tag}-$(date -I)"

bash scripts/docker-login.sh

bash scripts/build.sh