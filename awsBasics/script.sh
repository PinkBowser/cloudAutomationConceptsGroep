    #!/bin/bash
    sudo su
    yum update
    yum upgrade -y
    yum install -y git
    yum install -y aspnetcore-runtime-6.0
    yum install -y dotnet-sdk-6.0
    dnf update dotnet6.0 --releasever 2023.1.20230719
    cd /root
    git clone https://github.com/looking4ward/CloudShirt.git
    sed -i 's/Server.*CatalogDb;/Server=${RDSENDPOINT},1433;User ID=csadmin;Password=cspasswd;Initial Catalog=Microsoft.eShopOnWeb.CatalogDb;/' /root/CloudShirt/src/Web/appsettings.json
    sed -i 's/Server.*Identity;/Server=${RDSENDPOINT},1433;User ID=csadmin;Password=cspasswd;Initial Catalog=Microsoft.eShopOnWeb.Identity;/' /root/CloudShirt/src/Web/appsettings.json
  - RDSENDPOINT:
      Fn::ImportValue: myRDS:RDSEndpointAddress
    cd CloudShirt/src/Web
    dotnet publish -c Release -o ../../../release
    cd ../../../release
    dotnet Web.dlle