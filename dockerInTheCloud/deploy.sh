#!/bin/bash
aws cloudformation create-stack --stack-name CloudShirt --template-body dockerInTheCloud/dockerInTheCloudNetwerk.yaml
aws cloudformation create-stack --stack-name CloudShirtDB --template-body dockerInTheCloud/dockerInTheCloudRDS.yaml
aws cloudformation create-stack --stack-name CloudShirtJumpServer --template-body dockerInTheCloud/dockerInTheCloudJumpServer.yaml
aws cloudformation create-stack --stack-name CloudShirtBuildServer --template-body dockerInTheCloud/dockerInTheCloudBuildServer.yaml
aws cloudformation create-stack --stack-name CloudShirtASG --template-body dockerInTheCloud/dockerInTheCloudAutoScalingGroup.yaml