resource "aws_ecs_cluster" "main" {
  name = "main-ecs-cluster"
}

resource "aws_ecs_task_definition" "app" {
  family                   = "dotnet-app"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  container_definitions    = jsonencode([
    {
      name      = "dotnet-container",
      image     = "your-docker-image-uri",
      portMappings = [
        {
          containerPort = 80,
          hostPort      = 80,
          protocol      = "tcp"
        }
      ],
      logConfiguration = {
        logDriver = "awslogs",
        options = {
          awslogs-group         = aws_cloudwatch_log_group.app.name,
          awslogs-region        = var.region,
          awslogs-stream-prefix = "dotnet"
        }
      }
    }
  ])
}
