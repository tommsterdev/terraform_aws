 module "ecs" {
  source = "../../modules/ecs/variables.tf"
  app_name        = var.app_name
  container_image = var.container_image
  memory          = var.memory
  cpu             = var.cpu
  desired_count   = var.desired_count
  subnets         = var.subnets
  vpc_id          = var.vpc_id
  target_group_arn = var.target_group_arn
  task_execution_role_arn = var.task_execution_role_arn
  security_group_id     = var.security_group_id
  log_group_name        = var.log_group_name
}

module "vpc" {
  source = "../../modules/vpc/variables.tf"

  name               = "dev"
  cidr_block         = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones = data.aws_availability_zones.available.names
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}