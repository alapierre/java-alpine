#!/bin/bash

echo "Batch Java Docker image builder v. 1.0.0"
echo "----------------------------------------"

# shellcheck disable=SC2046
export $(grep -E -v '^#' .env | xargs)

declare RED='\033[0;31m'
declare NC='\033[0m' # No Color

(cd jdk-8 && make multiarch)
(cd jdk-11 && make multiarch)
(cd jdk-14 && make multiarch)
(cd jdk-15 && make multiarch)
(cd jdk-16 && make multiarch)
(cd jdk-17 && make multiarch)


trivy "$IMAGE_NAME":8
trivy "$IMAGE_NAME":11
trivy "$IMAGE_NAME":14
trivy "$IMAGE_NAME":15
trivy "$IMAGE_NAME":16
trivy "$IMAGE_NAME":17
