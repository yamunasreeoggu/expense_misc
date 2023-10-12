terraform {
   backend "s3" {
     bucket = "terraform-statefile-yamuna"
     key    = "expense-project/dev/terraform.tfstate"
     region = "us-east-1"
   }
}

data "aws_instance" "instance" {
  instance_id = "i-00a38bfea406e2acd"
}

resource "aws_route53_record" "jenkins-ip" {
  name    = "jenkins.yamunadevops.online"
  type    = "A"
  zone_id = "Z10281701O26X6KFZM8G8"
  records = [data.aws_instance.instance.public_ip]
  ttl = 10
}