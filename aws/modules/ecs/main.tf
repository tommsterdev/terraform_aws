resource "aws_ecs_cluster" "this" {
  name = "${var.app_name}-cluster"
}

resource "aws_ecs_task_definition" "this" {
  family                   = "${var.app_name}-task"
  network_mode             = "awsvpc"
  container_definitions    = jsonencode([{
    name      = "${var.app_name}-container"
    image     = var.container_image
    memory    = var.memory
    cpu       = var.cpu
    essential = true
    portMappings = [
      {
        containerPort = 80
        hostPort      = 80
        protocol      = "tcp"
      }
    ]
  }])
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = var.task_execution_role_arn
}

resource "aws_ecs_service" "this" {
  name            = "${var.app_name}-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = var.subnets
    security_groups   = [var.security_group_id]
    assign_public_ip  = true
  }
  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "${var.app_name}-container"
    container_port   = 80
  }
  depends_on = [aws_lb_listener.this]
}
