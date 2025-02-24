COMMAND:

#Tạo Keypair using SSH:

ssh-keygen -t rsa -b 4096 -m PEM -f my-key
#Enter path for new key: for example /id.rsa

#Terraform EC2 Instance definition syntax: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

#Command Terraform:

terraform init

terraform plan
terraform apply

terraform destroy

#Cách chạy Terraform:

terraform init

terraform apply -auto-approve

#Resource security groups

resource "aws_security_group" "test-security-group" {

name = "test-security-group"

description = "Allow SSH and HTTP traffic"


ingress {

from_port = 22

to_port = 22

protocol = "tcp"

cidr_blocks = ["0.0.0.0/0"] # Cho phép SSH từ mọi nơi (Cần chỉnh nếu cần bảo mật)

}


ingress {

from_port = 80

to_port = 80

protocol = "tcp"

cidr_blocks = ["0.0.0.0/0"] # Cho phép HTTP từ mọi nơi

}


egress {

from_port = 0

to_port = 0

protocol = "-1"

cidr_blocks = ["0.0.0.0/0"] # Cho phép tất cả outbound traffic

}

}
