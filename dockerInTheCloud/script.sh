UserData: 
          Fn::Base64: !Sub
          - |
            #!/bin/bash
            # Update en installeer benodigde pakketten
            yum update -y
            yum upgrade -y
            yum install -y docker
            sudo service docker start
            sudo systemctl enable docker
            # docker swarm join --token ${JoinToken} ${SwarmManagerPrivateIp}:2377
          - SwarmManagerPrivateIp:
              Fn::ImportValue: CloudShirtBuildServer:PrivateIp