# Project and AWS settings
project_name = "my-sample-project"
aws_region   = "af-south-1"

# Backend (state storage) settings
backend_bucket         = "terraform-state-bucket"
backend_key            = "my-sample-project/terraform.tfstate"
backend_region         = "af-south-1"
backend_dynamodb_table = "terraform-lock-table"

# VPC settings
vpc_cidr = "10.0.0.0/16"

# EC2 settings
ec2_instance_count = 1

# RDS settings
rds_enabled = true
# db_password = "yourStrongPostgresPasswordHere"
# ^ Uncomment and set, or use TF_VAR_db_password env variable 