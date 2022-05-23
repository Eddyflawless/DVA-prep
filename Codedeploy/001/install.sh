#!/bin/bash

yum -y update
yum install -y ruby
cd /home/ec2-user
curl -O https://aws-codedeploy-us-east-1.s3.amazonaws.com/lastest/install
curl +x ./install
./install auto
yum -y install httpd
service httpd start
chkconfig httpd on
groupadd www
usermod -a -G www ec2-user
chown -R root:www /var/www
chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} + 
cd /var/www/html
touch index.html
echo "helo world" > index.html
