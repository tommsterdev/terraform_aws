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