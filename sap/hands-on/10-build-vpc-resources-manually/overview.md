Build VPC Resources Manually

# Scenario

In this challenge, you will create a custom VPC with public and private subnets, and an Internet and NAT Gateway. You will then associate route tables with the correct subnets.

# Steps

# Create a new vpc

- On the AWS command bar, ensure that the selected region is Ohio.

- Display the VPC dashboard.

- Create a VPC by using the VPC wizard and the values in the following table. For any setting not specified, use the default value.

Setting Value

Resources to create VPC Only

Name tag `Lab VPC`

IPv4 CIDR `10.0.0.0/16`

IPv6 CIDR block `No IPv6 CIDR block`

Tenancy `Default`

![alt text](image.png)

![alt text](image-1.png)

![alt text](image-2.png)

# Create public subnets

Create a public subnet by using the values in the following table. For any setting that is not specified, use the default value.

Setting Value

VPC `Lab VPC`

Subnet name `Public Subnet 1`

Availability Zone `US East (Ohio) / us-east-2a`

IPv4 subnet CIDR block `10.0.1.0/24`

Create a second `public subnet` by using the values in the following table. For any setting that is not specified, use the default value.

Setting Value

VPC `Lab VPC`

Subnet name `Public Subnet 2`

Availability Zone `US East (Ohio) / us-east-2b`

IPv4 subnet CIDR block `10.0.2.0/24`

Enable auto-assignment of public IP addresses on Public Subnet 1.

Enable auto-assignment of public IP addresses on Public Subnet 2.

![alt text](image-3.png)

![alt text](image-4.png)

![alt text](image-5.png)

![alt text](image-6.png)

# Create private subnets

Create a private subnet by using the values in the following table. For any setting that is not specified, use the default value.

Setting Value

VPC `Lab VPC`

Subnet name `Private Subnet 1`

Availability Zone `US East (Ohio) / us-east-2a`

IPv4 subnet CIDR block `10.0.3.0/24`

Create a second private subnet by using the values in the following table. For any setting that is not specified, use the default value.

Setting Value

VPC `Lab VPC`

Subnet name `Private Subnet 2`

Availability Zone `US East (Ohio) / us-east-2b`

IPv4 subnet CIDR block `10.0.4.0/24`

![alt text](image-7.png)

![alt text](image-8.png)

![alt text](image-9.png)

![alt text](image-10.png)

# Create an internet gateway

Create an internet gateway named `Internet Gateway`.

Attach the internet gateway to `Lab VPC`.

![alt text](image-11.png)

![alt text](image-12.png)

![alt text](image-13.png)

# Create a NAT gateway

- Allocate a new `Elastic IP address`.

- Create a NAT gateway by using the `Public Subnet 1` subnet and your new Elastic IP address.

- Occasionally refresh the page until the `State` of your NAT gateway is `Available`-the creation process may take up to approximately three minutes.

![alt text](image-14.png)

![alt text](image-15.png)

![alt text](image-16.png)

![alt text](image-17.png)

# Configure route table

- Display the `Route Tables`.

- Ensure that the default route table for `Lab VPC` has a route to your `NAT gateway`.

  - On the Route tables page, locate the route for Lab VPC that has a value of Yes, and then select the check box next to the route.
  - In the details pane, select the Routes tab.
  - Confirm that Destination 10.0.0.0/16 is set to the local target.
  - In the Routes pane, select Edit routes.
  - On the Edit routes page, select Add route.
  - In Destination, enter 0.0.0.0/0.
  - In Target, select NAT Gateway, and then select the ID of your NAT gateway-this means that traffic destined for the internet (0.0.0.0/0) will be sent to the NAT gateway.

  - Select Save changes.

![alt text](image-18.png)

![alt text](image-19.png)

![alt text](image-20.png)

![alt text](image-21.png)

![alt text](image-22.png)

![alt text](image-23.png)

## Create a new route table named Public Route Table for Lab VPC.

![alt text](image-24.png)

![alt text](image-25.png)

![alt text](image-26.png)

![alt text](image-27.png)

# Summary

Congratulations, you have completed the Build VPC Resources Manually Challenge Lab.

You have accomplished the following:

Created a custom VPC that has public and private subnets, an internet gateway, and a NAT gateway.

Created and associated route tables with subnets.
