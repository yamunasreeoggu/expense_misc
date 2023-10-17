terraform {
   backend "s3" {
     bucket = "terraform-statefile-yamuna"
     key    = "expense-project/dev/terraform.tfstate"
     region = "us-east-1"
   }
}

data "aws_instance" "jenkins" {
  instance_id = "i-00a38bfea406e2acd"
}

resource "aws_route53_record" "jenkins" {
  name    = "jenkins.yamunadevops.online"
  type    = "A"
  zone_id = "Z10281701O26X6KFZM8G8"
  records = [data.aws_instance.jenkins.public_ip]
  ttl = 10
}

data "aws_instance" "artifactory" {
  instance_id = "i-097384ecfa5ff283e"
}

resource "aws_route53_record" "artifactory" {
  name    = "artifactory.yamunadevops.online"
  type    = "A"
  zone_id = "Z10281701O26X6KFZM8G8"
  records = [data.aws_instance.artifactory.public_ip]
  ttl = 10
}