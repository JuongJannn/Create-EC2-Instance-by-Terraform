README: Hướng dẫn tạo EC2 Instance với Terraform và SSH
1. Mục lục
2. Tạo Keypair bằng SSH
3. Định nghĩa Terraform cho EC2 Instance
4. Các lệnh Terraform cơ bản
5. Cách chạy Terraform
6. Cấu hình Security Group
7. Tóm tắt quy trình

Tạo Keypair bằng SSH
Để kết nối an toàn với EC2 instance, bạn cần tạo một cặp khóa (keypair) bằng SSH. Hãy chạy lệnh sau trong terminal:

bash
ssh-keygen -t rsa -b 4096 -m PEM -f my-key

Định nghĩa Terraform cho EC2 Instance
Terraform cho phép bạn định nghĩa cơ sở hạ tầng dưới dạng mã (Infrastructure as Code). Để định nghĩa một EC2 instance, bạn cần tạo file main.tf và sử dụng resource aws_instance.
Tài liệu tham khảo: Terraform AWS EC2 Instance Documentation.

Các lệnh Terraform cơ bản
Dưới đây là các lệnh Terraform cần thiết để quản lý tài nguyên:
Khởi tạo Terraform:
terraform init
Xem trước thay đổi:
terraform plan
Áp dụng thay đổi:
terraform apply
Hủy tài nguyên:
terraform destroy

Cách chạy Terraform
terraform init
terraform apply -auto-approve

Cấu hình Security Group
resource "aws_security_group" "test-security-group" {
  name        = "test-security-group"
  description = "Allow SSH and HTTP traffic"

  # Quy tắc inbound cho SSH (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Cho phép SSH từ mọi IP
  }

  # Quy tắc inbound cho HTTP (port 80)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Cho phép HTTP từ mọi IP
  }

  # Quy tắc outbound cho tất cả traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"           # Tất cả protocol
    cidr_blocks = ["0.0.0.0/0"]  # Cho phép gửi traffic đến mọi IP
  }
}

Tóm tắt quy trình
Tạo keypair: Chạy ssh-keygen để tạo cặp khóa SSH.
Viết file Terraform: Định nghĩa EC2 instance và security group trong main.tf.
Khởi tạo Terraform: Chạy terraform init.
Tạo tài nguyên: Chạy terraform apply -auto-approve.
Kết nối EC2: Dùng lệnh SSH với khóa riêng để truy cập instance
ssh -i my-key ec2-user@<EC2_PUBLIC_IP>
Hủy tài nguyên: Chạy terraform destroy khi không cần nữa.
