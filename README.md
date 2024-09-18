## Eerste Opdracht
REQ-01 : "The CloudShirt .NET solution is high available across multiple AZ's using one url"\
REQ-02 : "The CloudShirt .NET solution can scale out during spike traffic hours between 6pm and 8pm Eastern timezone"\
REQ-03 : "Elastic File System (EFS) is used to store public webserver logfiles on a daily basis."\
REQ-04 : "The data tier of the CloudShirt .NET solution is based on Amazon RDS."\
REQ-05 : "As a monitoring solution the Elastic (ELK) Stack v8.x is provisioned."\
REQ-06 : "Logs are made visible on Elastic Stack using FileBeat"\
REQ-07 : "RDS snapshop data is backupped to an S3 bucket using a AWS-CLI script, so external Athena partner can analyse it."\

## Eisen Project
1.1. provision a server and deploy a webapp using userdata\
1.2. deploy a private subnet with NAT\
1.3. provision a database in the cloud\
1.4. provision an auto scaling group with proper policies to scale out servers\
1.5. provision a load balancer to divide load over multiple servers\
1.6. provision a S3 bucket and deploy a static website using AWS CLI (or backup an RDS snapshot to the S3 bucket.)

## Eisen Project voor meer punten
1.7. provision a file share in the cloud\
1.8. deploy a monitoring solution\
1.9. deploy a serverless application

## Wat werkt:
