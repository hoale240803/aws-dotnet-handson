# Understand

Lab
45m45minutes
Skillsoft
English
Intermediate
Amazon Web Services

Before you start :
You have five attempts to complete each Challenge Lab.
Be sure to allow enough time to complete each Challenge Lab without interruption. Once you begin a Lab, you cannot save or pause it.
Challenge labs are meant to challenge you! We encourage you to learn by doing, and by discovery.
In this challenge, you will configure and deploy Elastic Compute Cloud (EC2) instances by using an Auto Scaling group. First, you will create a security group for a launch template, and then you will configure a launch template. Next, you will create an Auto Scaling group. Finally, you will test the Auto Scaling group. Note: Once you begin the challenge, you will not be able to pause, save, or exit and then return to your challenge. Please ensure that you have set aside enough time to complete the challenge before you start.

# Understand scenario

Understand the scenario
You are an Administrator with Hexelo, an organization that needs to manage an Amazon Web Services (AWS) environment.

In this Challenge Lab, you will configure and deploy Elastic Compute Cloud (EC2) instances by using an Auto Scaling group. First, you will create a security group for a launch template, and then you will configure a launch template. Next, you will create an Auto Scaling group. Finally, you will test the Auto Scaling group.

# Create security group

![alt text](image.png)
![alt text](image-1.png)

![alt text](image-5.png)

# Create a launch template

![alt text](image-2.png)

```
#!/bin/bash
yum update -y
sudo amazon-linux-extras install epel -y
sudo yum install stress -y
amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
yum install -y httpd
systemctl start httpd
systemctl enable httpd
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www
chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;
echo '<center><h1>Welcome to Server: <?php echo $_SERVER["SERVER_ADDR"]; ?></h1><br><br></center>' > /var/www/html/index.php
```

![alt text](image-10.png)
![alt text](image-11.png)

# Create ASG - auto scaling group

![alt text](image-3.png)
![alt text](image-6.png)

![alt text](image-7.png)
![alt text](image-8.png)
![alt text](image-9.png)

## outcome

![alt text](image-4.png)

# summary

Created a security group.
Configured a launch template.
Created an Auto Scaling group.
Tested the Auto Scaling group.
