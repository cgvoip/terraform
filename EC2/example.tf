#  aws sts get-caller-identity

# provider.aws: version = "~> 1.5"

#####################################################################
#VARIABLES
#####################################################################

# variable "aws_access_key" {}
# variable "aws_secret_key" {}
# variable "private_key_path" {} 
# variable "key_name" {
#    default = "Invescokeys"
# }	

#####################################################################
#PROVIDERS
#####################################################################

provider "aws" {
# shared_credentials_file = "/root/.aws/creds"
version = "~> 1.5"
profile = "default"
#  access_key = "AKIAJEQ4SFIQTIUXBJZQ"
#  secret_key = "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"
#  region     = "us-east-1"
}

######################################################################
#RESOURCES
######################################################################

resource "aws_instance" "example" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"

# depends_on is not needed for EIP but would be if an S3 bucket was created
# depends_on = ["aws_instance.example"]
}

# New resource for the S3 bucket our application will use.
# resource "aws_s3_bucket" "example" {
  # NOTE: S3 bucket names must be unique across _all_ AWS accounts, so
  # this name must be changed before applying this example to avoid naming
  # conflicts.
#  bucket = "terraform_getting_started_guide"
#  acl    = "private"
# }

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}
