#!/bin/bash
sudo yum update
sudo yum upgrade -y
sudo yum install -y git
sudo yum install -y aspnetcore-runtime-6.0
sudo yum install -y dotnet-sdk-6.0
sudo dnf update dotnet6.0 --releasever 2023.1.20230719
sudo cd /root
git clone https://github.com/looking4ward/CloudShirt.git
