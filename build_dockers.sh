#!/bin/bash
read -p "version tag: " ver
echo

tag=v$(date +"%F")
if [ -n "$ver" ]
then
  tag="${tag}_$ver"
else
  tag="latest"
fi
echo "Tag: $tag"
root_dir=$(pwd)
cd app
docker image build --tag registry.spin.nersc.gov/perssongroup/mp-minio-app:$tag .
docker image push registry.spin.nersc.gov/perssongroup/mp-minio-app:$tag
cd $root_dir
cd web
docker image build --tag registry.spin.nersc.gov/perssongroup/mp-minio-web:$tag .
docker image push registry.spin.nersc.gov/perssongroup/mp-minio-web:$tag
cd $root_dir
