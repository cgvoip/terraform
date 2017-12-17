module "alb" {
  source                        = "terraform-aws-modules/alb/aws"
  alb_name                      = "my-alb"
  region                        = "us-east-2"
  alb_security_groups           = ["sg-edcd9784", "sg-edcd9785"]
  vpc_id                        = "vpc-abcde012"
  subnets                       = ["subnet-abcde012", "subnet-bcde012a"]
  alb_protocols                 = ["HTTPS"]
  certificate_arn               = "<arn certificate>"
  create_log_bucket             = true
  enable_logging                = true
  log_bucket_name               = "<insert S3 bucket name here>"
  log_location_prefix           = "my-alb-logs"
  health_check_path             = "/"

  tags {
    "Terraform" = "true"
    "Env"       = "${terraform.workspace}"
  }
}
