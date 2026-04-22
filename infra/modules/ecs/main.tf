resource "aws_ecs_cluster" "ecs_cluster" {
  name = "threat-composer-cluster"
}

resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = "threat-composer-app"
  cpu                      = var.ecs_cpu
  memory                   = var.ecs_memory
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  execution_role_arn = var.aws_iam_role_arn

  container_definitions = jsonencode([
    {
      name      = "threat-composer-app"
      #image     = var.image_uri
      image = "${var.image_uri}:${var.image_tag}"
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.host_port
        }
      ]
    }
  ])
}



resource "aws_security_group" "ecs_sg" {
    name        = "ecs_sg"
    description = "Security group for ECS"
    vpc_id      = var.vpc_id
    ingress {
        from_port   = 3000
        to_port     = 3000
        protocol    = "tcp"
        security_groups = [var.alb_sg_id]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_ecs_service" "ecs_service" {
  name            = "threat-composer-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  
  network_configuration {
    subnets         = var.private_subnet_ids
    security_groups = [aws_security_group.ecs_sg.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "threat-composer-app"
    container_port   = var.container_port
  }
}