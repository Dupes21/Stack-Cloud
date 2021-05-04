# Creating a new security group for EC2 instance 

resource "aws_security_group" "wp_efs_sg" {
   name = "wp_efs_sg"
   #vpc_id = "${aws_vpc.test-env.id}"

ingress {
description = "SSH from VPC"
from_port   = 22
to_port     = 22
protocol    = "tcp"
cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
description = "HTTP from VPC"
from_port   = 80
to_port     = 80
protocol    = "tcp"
cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
description = "HTTPS from VPC"
from_port   = 3306
to_port     = 3306
protocol    = "tcp"
cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
description = "MYSQL/Aurora"
from_port   = 443
to_port     = 443
protocol    = "tcp"
cidr_blocks = ["0.0.0.0/0"]
  }


ingress {
description = "EFS mount target"
from_port   = 2049
to_port     = 2049
protocol    = "tcp"
cidr_blocks = ["0.0.0.0/0"]
 }



egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
