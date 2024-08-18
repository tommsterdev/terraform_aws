variable name {
  description = "The name of the load balancer"
  type        = string
}

variable subnets {
  description = "The subnets to place the load balancer in"
  type        = list(string)
}

variable security_group_id {
  description = "The security group to associate with the load balancer"
  type        = string
}

variable app_name {
  description = "The name of the application"
  type        = string
}

variable vpc_id {
  description = "The ID of the VPC"
  type        = string
}