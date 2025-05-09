# 1. Create structure folder
For Git Bash/MINGW64 terminal:

```
mkdir -p terraform-ecs-dotnet
cd terraform-ecs-dotnet

mkdir -p app terraform
touch terraform/{main.tf,variables.tf,outputs.tf,vpc.tf,ecs.tf,alb.tf,rds.tf,cloudwatch.tf}

touch app/.gitkeep

touch Dockerfile .gitignore README.md
```

:todo
Verify structure 

![Project Structure](https://hoale240803.git/terraform-ecs-dotnet)

# 2. Create .NET core web api

- Create api project
```
# Create the .NET Web API project named "demo" in the app folder
dotnet new webapi -o app -n demo
```

# 3. Create, build Dockerfile and push image to ECR
```
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

WORKDIR /src
COPY ["app/app.csproj", "app/"]
RUN dotnet restore "app/app.csproj"
COPY . .

WORKDIR "/src/app"
RUN dotnet build "app.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "app.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app

COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "app.dll"]
```

## 3.1 Build image on local

Build image with docker
```
docker build -t demo-app .
```

Run the docker
```
docker run -p 8080:80 demo-app
```

**Note**
 Configuring ports in a .NET application involves multiple layers of configuration, with a clear hierarchy of fallback options

Hierarchy of Precedence
- Command-line args (--urls="http://*:8080")
- Environment variables (ASPNETCORE_URLS)
- appsettings.{Environment}.json
- appsettings.json
- Hardcoded defaults in Program.cs

# 4. Build and push the Docker image to ECR
```
aws ecr create-repository --repository-name dotnet-app

$(aws ecr get-login --no-include-email)

docker build -t dotnet-app .

docker tag dotnet-app:latest <your-account-id>.dkr.ecr.<region>.amazonaws.com/

dotnet-app:latest

docker push <your-account-id>.dkr.ecr.<region>.amazonaws.com/dotnet-app:latest
```
# 4.1 Test app connect with rds on local first


# 5. Terraform Configuration
Provider Configuration (main.tf)

```
provider "aws" {
  region = "us-east-1"
}
```

VPC Setup (**vpc.tf**): Define a VPC with public and private subnets, internet gateway, NAT gateway, and route tables.

Security Groups: Create security groups for ALB, ECS tasks, and RDS with appropriate ingress and egress rules.

RDS Instance (**rds.tf**): Provision a PostgreSQL or SQL Server RDS instance in private subnets.

ECS Cluster and Service (**ecs.tf**):
- Define an ECS cluster.
- Create a task definition referencing the Docker image in ECR.
- Set up an ECS service with Fargate launch type in private subnets.

Application Load Balancer (**alb.tf**):
- Create an ALB in public subnets.
- Set up a target group pointing to the ECS service.
- Configure a listener on port 80 forwarding to the target group.

CloudWatch Logs (**cloudwatch.tf**):  
- Configure log groups for ECS task logs.
- Variables and Outputs: Define necessary variables in **variables.tf** and output values like -ALB DNS name in **outputs.tf**.

# 6. Deployment Steps

Initialize Terraform

```
terraform init
```

Plan the Deployment

```
terraform plan
```
Apply the configuration

```
terraform apply
```


