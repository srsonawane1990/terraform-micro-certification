variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  default     = "10.15.0.0/18"
}

variable "public_subnet_cidr_blocks" {
  description = "CIDR blocks for public subnets"
  default     = ["10.15.0.0/20", "10.15.16.0/20"]
}

variable "public_subnet_multi_azs" {
  description = "Multi Azs for public subnets"
  default     = ["us-east-1a", "us-east-1b"]
}


variable "private_subnet_cidr_blocks" {
  description = "CIDR blocks for private subnets"
  default     = ["10.15.32.0/22", "10.15.36.0/22", "10.15.40.0/22", "10.15.44.0/22"]
}

variable "private_subnet_multi_azs" {
  description = "Multi Azs for public subnets"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
}

variable "db_password" {
  description = "Password for the database"
  default     = "password"
  sensitive   = true
}
