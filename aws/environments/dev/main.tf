module "vpc" {
  source = "../../modules/vpc"

  name                = "dev"
  cidr_block          = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
}

module "security_groups" {
  source = "../../modules/security_groups"

  name   = "dev"
  vpc_id = module.vpc.vpc_id
}

module "load_balancer" {
  source = "../../modules/load_balancer"

  name              = "dev"
  vpc_id            = module.vpc.vpc_id
  subnets           = concat(module.vpc.public_subnet_ids, module.vpc.publlic_subnet2_ids)
  security_group_id = module.security_groups.security_group_id
  app_name          = "dev"

}

module "iam" {
  source = "../../modules/iam"

}

module "ecs" {
  source = "../../modules/ecs"

  vpc_id                  = module.vpc.vpc_id
  container_image         = var.container_image
  subnets                 = module.vpc.public_subnet_ids
  target_group_arn        = module.load_balancer.target_group_arn
  app_name                = "dev"
  task_execution_role_arn = module.iam.task_execution_role_arn
  desired_count           = 1
}
