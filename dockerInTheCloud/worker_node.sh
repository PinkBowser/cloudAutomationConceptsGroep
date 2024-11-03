#!/bin/bash
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 093215643118.dkr.ecr.us-east-1.amazonaws.com
docker pull 093215643118.dkr.ecr.us-east-1.amazonaws.com/eshoppublicapi:latest
docker pull 093215643118.dkr.ecr.us-east-1.amazonaws.com/eshopwebmvc:latest