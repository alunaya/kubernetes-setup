echo 'proxy=http://10.61.11.42:3128' | sudo tee -a /etc/yum.conf

yum update -y

cat << EOF >> /home/vagrant/.bashrc
export http_proxy=http://10.61.11.42:3128
export https_proxy=http://10.61.11.42:3128
no_proxy=localhost,127.0.0.1,192.168.0.1/27
EOF