#!/bin/bash
WORK_PATH='/usr/projects/nodeSwigmpa'
cd $WORK_PATH
echo "清除老代码"
git reset --hard origin/master
git clean -f
echo "拉取新代码"
git pull origin master
npm install
npm run gulpSer
npm run webDev
npm run start
echo "开始执行构建"
docker build -t nodeSwigMpa:1.0 .
echo "停止旧容器并删除旧容器"
docker stop node-container
docker rm node-container
echo "启动新容器"
docker container run -p 8081:8081 --name node-container -d nodeSwigMpa:1.0