((count = 10))
while [[ $count -ne 0 ]] ; do
    ping -c 1 10.61.11.42
    rc=$?
    if [[ $rc -eq 0 ]] ; then
        ((count = 0))
    else
    ((count = count - 1))
    fi
done

if [[ $rc -eq 0 ]] ; then
  curl https://www.centos.org/keys/RPM-GPG-KEY-CentOS-Official -o /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-Official --httpproxy http://10.61.11.42:3128
else
  curl https://www.centos.org/keys/RPM-GPG-KEY-CentOS-Official -o /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-Official
fi

rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-Official

dnf update -y
dnf install epel-release -y
dnf update -y
dnf install gdisk netstat net-tools centos-release-gluster -y
dnf install glusterfs-server -y

mkdir -p /data/brick1
echo '/dev/sdb1 /data/brick1  xfs defaults  0 0' | sudo tee -a /etc/fstab