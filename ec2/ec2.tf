# # Webサーバ
resource "aws_instance" "web" {
  ami           = "ami-0ef29ab52ff72213b"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet_1a.id
  security_groups = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "wp-test-ec2"
  }

  user_data = <<-EOF
              # #!/bin/bash

              # # アップデート
              # dnf update -y

              # # タイムゾーンの設定
              # timedatectl set-timezone Asia/Tokyo

              # # Swap領域の作成
              # dd if=/dev/zero of=/swapfile1 bs=1M count=1024
              # chmod 600 /swapfile1
              # mkswap /swapfile1
              # swapon /swapfile1
              # echo '/swapfile1 swap swap defaults 0 0' >> /etc/fstab

              # # NginxとPHPのインストール
              # dnf install -y nginx php8.2 php-fpm php-mysqlnd

              # # NginxとPHP-FPMのサービスを開始および有効化
              # systemctl start nginx
              # systemctl enable nginx
              # systemctl start php-fpm
              # systemctl enable php-fpm

              # # PHPの設定変更（最低限必要な設定）
              # sed -i 's/expose_php = On/expose_php = Off/' /etc/php.ini
              # echo "date.timezone = Asia/Tokyo" >> /etc/php.ini

              # # MySQLのインストール
              # dnf -y localinstall https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
              # rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2023
              # dnf install -y mysql-community-server
              # systemctl start mysqld
              # systemctl enable mysqld

              # # WordPressのインストール
              # wget https://ja.wordpress.org/latest-ja.tar.gz
              # tar -zxvf latest-ja.tar.gz
              # rm latest-ja.tar.gz
              # rm -rf /usr/share/nginx/html/*
              # cp -r wordpress/* /usr/share/nginx/html/
              # chown -R nginx:nginx /usr/share/nginx/html/

              # # Nginx設定の修正
              # sed -i 's|try_files $uri $uri/ =404;|try_files $uri $uri/ /index.php?$args;|' /etc/nginx/nginx.conf

              # # NginxとPHP-FPMの再起動
              # systemctl restart nginx
              # systemctl restart php-fpm
              EOF
}

# 踏み台サーバ
resource "aws_instance" "bastion" {
  ami           = "ami-0ef29ab52ff72213b"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet_1a.id
  security_groups = [aws_security_group.bastion_sg.id]
  key_name = "wp-test"

  tags = {
    Name = "wp-test-bastion"
  }
}