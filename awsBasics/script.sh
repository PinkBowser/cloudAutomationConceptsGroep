#!/bin/bash
# Update en installeer benodigde pakketten
sudo yum update -y
sudo yum upgrade -y

# Installeer git en .NET 6.0 runtime en SDK
sudo yum install -y git
sudo yum install -y aspnetcore-runtime-6.0
sudo yum install -y dotnet-sdk-6.0

# Update specifieke dotnet versie met dnf
sudo dnf update dotnet6.0 --releasever=2023.1.20230719 -y

# Clone de repository en bouw de applicatie
cd /root
sudo git clone https://github.com/looking4ward/CloudShirt.git
cd CloudShirt/src/Web

# Publiceer de dotnet applicatie
sudo dotnet publish -c Release -o ../../../release

# Navigeer naar de release map en start de applicatie
cd ../../../release
sudo dotnet Web.dll
