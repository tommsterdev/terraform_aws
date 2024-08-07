variable "app_name" {
  description = "The name of the application"
  type        = string
}

variable "container_image" {
  description = "The Docker image to use for the container"
  type        = string
}

variable "memory" {
  description = "The amount of memory to allocate to the container"
  type        = number
  default     = 512
}

variable "cpu" {
  description = "The amount of CPU to allocate to the container"
  type        = number
  default     = 256
}

variable "desired_count" {
  description = "The desired number of container instances"
  type        = number
  default     = 1
}

variable "subnets" {
  description = "The list of subnet IDs for the ECS service"
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "target_group_arn" {
  description = "The ARN of the target group for the load balancer"
  type        = string
}

variable "task_execution_role_arn" {
  description = "The ARN of the IAM role for ECS task execution"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group for ECS tasks"
  type        = string
}

variable "log_group_name" {
  description = "The name of the CloudWatch log group"
  type        = string
}
