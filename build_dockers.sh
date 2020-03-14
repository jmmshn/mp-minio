#!/bin/bash

root_dir=$(pwd)
cd app
docker build .

cd $root_dir
cd web
docker build .

cd $root_dir
