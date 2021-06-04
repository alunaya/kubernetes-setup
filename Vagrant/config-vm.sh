
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

echo 'proxy=http://10.61.11.42:3128' | tee -a /etc/yum.conf

cat << EOF >> /home/vagrant/.bashrc
export http_proxy=http://10.61.11.42:3128
export https_proxy=http://10.61.11.42:3128
no_proxy=localhost,127.0.0.1,192.168.0.1/27
EOF

yum install epel-release -y
yum update -y
exit
fi

yum update -y
yum install epel-release -y
yum update -y