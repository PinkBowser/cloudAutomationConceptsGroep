#!/bin/bash
export BUCKET_NAME=cloudshirt-demowebsite
aws s3api create-bucket --bucket $BUCKET_NAME --acl public-read
aws s3 website s3://$BUCKET_NAME --index-document index.html
echo '{"Version":"2012-10-17","Statement":[{"Sid": "PublicReadGetObject","Effect": "Allow","Principal": "*","Action": "s3:GetObject","Resource": "arn:aws:s3:::'${BUCKET_NAME}'/*"}]}' > policy_s3.json
aws s3api put-bucket-policy --bucket $BUCKET_NAME --policy file://policy_s3.json
echo "<html><center><h1>My Static Website on S3</h1></center></html>" > index.html
aws s3 cp index.html s3://$BUCKET_NAME