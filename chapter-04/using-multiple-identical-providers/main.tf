#######################################################################
# title:    4.11 - Using Multiple, Identical Providers
# original: https://github.com/terraform-cookbook/recipes/tree/main/chapter-04/using-multiple-identical-providers
#######################################################################

# EC2 instance in the default region (us-west-2)
resource "aws_instance" "west_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "WestServerInstance"
  }
}

# EC2 instance in the US East region
resource "aws_instance" "east_server" {
  provider      = aws.east
  ami           = "ami-0747bdcabd34c712a"
  instance_type = "t2.micro"

  tags = {
    Name = "EastServerInstance"
  }
}

# S3 bucket in the default region
resource "aws_s3_bucket" "west_bucket" {
  bucket = "my-west-bucket-12345"
}

# S3 bucket in the US East region
resource "aws_s3_bucket" "east_bucket" {
  provider = aws.east
  bucket   = "my-east-bucket-67890"
}
