resource "aws_ecs_cluster" "ecs_cluster" {
  name = "threat-composer-cluster"

  tags = {
    Name = "threat-composer-cluster"
  }
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
      image     = "${var.image_uri}:${var.image_tag}"
      essential = true

      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.host_port
        }
      ]
    }
  ])

  tags = {
    Name = "threat-composer-task"
  }
}


resource "aws_security_group" "ecs_sg" {
  name        = "ecs-sg"
  description = "Security group for ECS tasks"
  vpc_id      = var.vpc_id

  tags = {
    Name = "ecs-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ecs_from_alb" {
  security_group_id            = aws_security_group.ecs_sg.id
  referenced_security_group_id = var.alb_sg_id

  from_port   = 3000
  to_port     = 3000
  ip_protocol = "tcp"
}


resource "aws_vpc_security_group_egress_rule" "ecs_all_outbound" {
  security_group_id = aws_security_group.ecs_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
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

  depends_on = [aws_vpc_security_group_ingress_rule.ecs_from_alb]

  tags = {
    Name = "threat-composer-service"
  }
}