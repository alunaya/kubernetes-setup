yum update -y
yum install epel-release -y
yum update -y
yum install gdisk netstat centos-release-gluster net-tools -y
yum install glusterfs-server -y
systemctl start glusterd
systemctl enable glusterd

mkdir -p /data/brick1
echo '/dev/sdb1 /data/brick1  xfs defaults  0 0' | sudo tee -a /etc/fstab