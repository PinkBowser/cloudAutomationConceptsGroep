#!/bin/bash
git pull
docker-compose -f docker-compose-build.yml build
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 093215643118.dkr.ecr.us-east-1.amazonaws.com
docker-compose -f docker-compose-build.yml push
docker stack deploy -c docker-compose-deploy.yml eshop-stack