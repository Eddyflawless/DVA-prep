
You must attach the CloudWatchAgentServerRole IAM role to the EC2 instance to be able to run the CloudWatch agent on the instance.
This role enables the CloudWatch agent to perform actions on the instance.

region=us-east
configuration_file_path=

## download
`wget https://s3.$region.amazonaws.com/amazoncloudwatch-agent-$region/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm`

## install
`sudo rpm -U ./amazon-cloudwatch-agent.rpm`

## configure CloudWatch agent configuration
`sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard`


## Start the CloudWatch agent
`sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:$configuration_file_path -s`

## stop Cloudwatch agent
`sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a stop`


## reference documentation
`https://aws.amazon.com/premiumsupport/knowledge-center/cloudwatch-push-metrics-unified-agent/`