# README: Hướng dẫn tạo EC2 Instance với Terraform và SSH
# Mục lục
Tạo Keypair bằng SSH
Định nghĩa Terraform cho EC2 Instance
Các lệnh Terraform cơ bản
Cách chạy Terraform
Cấu hình Security Group
Tóm tắt quy trình
# Tạo Keypair bằng SSH
Để kết nối an toàn với EC2 instance, bạn cần tạo một cặp khóa (keypair) bằng SSH. Hãy chạy lệnh sau trong terminal:
ssh-keygen -t rsa -b 4096 -m PEM -f my-key
# Định nghĩa Terraform cho EC2 Instance
Terraform cho phép bạn định nghĩa cơ sở hạ tầng dưới dạng mã (Infrastructure as Code). Để định nghĩa một EC2 instance, bạn cần tạo file main.tf và sử dụng resource aws_instance.
Tài liệu tham khảo: Terraform AWS EC2 Instance Documentation.
# Các lệnh Terraform cơ bản
Dưới đây là các lệnh Terraform cần thiết để quản lý tài nguyên:
Khởi tạo Terraform:
terraform init
Xem trước thay đổi:
terraform plan
Áp dụng thay đổi:
terraform apply
Hủy tài nguyên:
terraform destroy
# Cách chạy Terraform
terraform init
terraform apply -auto-approve
# Cấu hình Security Group
Quy tắc inbound cho SSH (port 22)
Quy tắc inbound cho HTTP (port 80)
Quy tắc outbound cho tất cả traffic
# Tóm tắt quy trình
1. Tạo keypair: Chạy ssh-keygen để tạo cặp khóa SSH.
2. Viết file Terraform: Định nghĩa EC2 instance và security group trong main.tf.
3. Khởi tạo Terraform: Chạy terraform init.
4. Tạo tài nguyên: Chạy terraform apply -auto-approve.
5. Kết nối EC2: Dùng lệnh SSH với khóa riêng để truy cập instance
6.ssh -i my-key ec2-user@<EC2_PUBLIC_IP>
7. Hủy tài nguyên: Chạy terraform destroy khi không cần nữa.
