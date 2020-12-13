#!/bin/bash

echo "Batch Java Docker image builder v. 1.0.0"
echo "----------------------------------------"

declare RED='\033[0;31m'
declare NC='\033[0m' # No Color
declare GIT_BASE_URL=git@github.com:alapierre

tmp_dir=$(mktemp -d -t java-XXXXXXXXXX)

echo "$tmp_dir"

cd "$tmp_dir" || { echo -e "${RED}ERROR${NC} Can't cd into temp dir $tmp_dir!"; exit 1; }

git clone "$GIT_BASE_URL/java-apline.git" java-apline || { echo -e "${RED}ERROR${NC} Can't clone $GIT_BASE_URL/java-apline.git"; exit 1; }
cd java-apline || { echo -e "${RED}ERROR${NC} Can't cd into project dir $tmp_dir/java-apline !"; exit 1; }
#make build push

git checkout origin/jdk14 -b jdk14
make build push

#git checkout origin/jdk15 -b jdk15
#make build push

cd ..
#rm $tmp_dir || { echo -e "${RED}ERROR${NC} Can't rm $tmp_dir"; exit 1; }
