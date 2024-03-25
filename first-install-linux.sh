#!/bin/bash

# Cập nhật danh sách package và package
echo "Cập nhật hệ thống..."
sudo apt-get update -y

# Cài đặt các tiện ích cần thiết
echo "Cài đặt git, zip, unzip, htop, và curl..."
sudo apt-get install -y git zip unzip htop curl

# Cài đặt Docker
echo "Cài đặt Docker..."
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce

# Thêm user hiện tại vào nhóm Docker để không cần sudo khi chạy Docker
sudo usermod -aG docker $USER

# Cài đặt Docker-compose
echo "Cài đặt Docker-compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Cài đặt hoàn tất! Vui lòng logout và login lại để áp dụng nhóm Docker."

# Cài đặt acme.sh
echo "Cài đặt acme.sh..."
curl https://get.acme.sh | sh

# Khởi động lại terminal để áp dụng thay đổi hoặc bạn có thể chạy source để nạp các alias mới
source ~/.bashrc
