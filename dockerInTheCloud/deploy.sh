#!/bin/bash
aws deploy --template-file dockerInTheCloud/dockerInTheCloudNetwerk.yaml --stack-name CloudShirt
aws deploy --template-file dockerInTheCloud/dockerInTheCloudRDS.yaml --stack-name CloudShirtDB
aws deploy --template-file dockerInTheCloud/dockerInTheCloudJumpServer.yaml --stack-name CloudShirtJumpServer
aws deploy --template-file dockerInTheCloud/dockerInTheCloudBuildServer.yaml --stack-name CloudShirtBuildServer
aws deploy --template-file dockerInTheCloud/dockerInTheCloudAutoScalingGroup.yaml --stack-name CloudShirtASG