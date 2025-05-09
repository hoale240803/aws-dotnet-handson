# Điều kiên tiên quyết
- install choco https://chocolatey.org/install
- install terraform https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

# Create user with administrator for access

# AMI
- Get AMI AWS Console > EC2 > Launch an instance

ex: Ubuntu: ami-084568db4383264d4, 

- U can able to search here https://cloud-images.ubuntu.com/locator/ec2/


# Terraform Cheetsheet
Format file

```
terraform fmt
```

Init resouces from provider
```
terraform init
```

Validate syntax

```
terraform validate
```
What will impact of your resouces when execute

```
terraform plan
```

After read the output you accept with it then apply it. 
 create any resouces on your provider

```
terraform apply
```

Check history of cmd you run on this resouces

```
history
```


NOTE: You can also find AMIs via AWS CLI or AWS console https://console.aws.amazon.com/ec2/v2/home?#Images
Example
```
aws ec2 describe-images \
  --owners 099720109477 \
  --filters "Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*" \
  --query "Images[*].[ImageId,Name]" \
  --output table
```

# Please clean up every resource before end this lab
```
terraform destroy
```
# Additional

Generate key-pair
```
ssh-keygen
```

## B. Variables
Whats's variable used for?
- Move secrets to another file
- Values that change: AMI, tags, kepair etc
- Reuse your code

Example: We want to change the region dynamically depend on project

providers.tf
```
provider "aws" {
  region = var.region
}
```

vars.tf
```
variable "region" {
  default = "us-east-1"
}
```

# C. Output information
- Terraform stores returned value of all resources created
  ex: aws_instance resource has the attribute  **public_ip**
- Use output block to print these attributes
- local-excec to save info to a file 

# D. Terraform state management
Problem
- Infra setup is complex process
- Not Repeatable
- Difficult to track, Not Centralized
- Chances of Human error
- Managing manually is time consuming task

Solution
- Configuration management of Infra
- Automatic Setup (NO Human Errors)
- Maintain State of Infrastructure 

- Version Control [IAAC]
- Repeatable 
- Reusable

Steps
- Setup Terraform with Backend
- Setup VPC[Secure & HA]
- Provision Beanstalk Environment
- Provision Backend Services
    - RDS
    - Elastic Cache
    - Active MQ
- Security Group, Key Pairs, Basstion Host
