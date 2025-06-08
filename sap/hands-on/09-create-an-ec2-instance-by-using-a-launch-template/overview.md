Create an ec2 instance by using a launch template

# Scenario

You are a systems architect. You need to create a template that you can use to create Amazon Web Services (AWS) EC2 instances. The template must support version control.

First, you will create a key pair, and then you will create a security group.

Next, you will create a launch template, and then you will use the launch template to create an EC2 instance.

Finally, you will create a new version of the template that will install an Apache web server, and then you will create a new EC2 instance that contains an Apache web server.

# Steps

# Create a key pair

![create a key pair](image.png)

![alt text](image-1.png)

# Create security group

![alt text](image-2.png)

![alt text](image-3.png)

![alt text](image-4.png)

# Launch a template

![alt text](image-5.png)

![alt text](image-6.png)

![alt text](image-7.png)

# Create an instance

![alt text](image-8.png)

![alt text](image-9.png)

![alt text](image-10.png)

![alt text](image-11.png)

# Modify the template

![alt text](image-12.png)

![alt text](image-13.png)

![alt text](image-14.png)

![alt text](image-15.png)

```
#!/bin/bash
yum update
yum -y install httpd
chkconfig httpd on
service httpd start
```

# Create new instance with the new launch template

![alt text](image-16.png)

![alt text](image-17.png)

![alt text](image-18.png)

# Summary

Created a key pair to use when launching instances.

Created a security group to allow HTTP traffic.

Created a launch template.

Created an EC2 instance by using the launch template.

Created a second version of the launch template that installs the Apache web server.

Created an EC2 instance by using version 2 of the launch template.
