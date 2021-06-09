#install kubernetes version 1.21
VERSION=1.21
OS=CentOS_8

#config iptables for bridge network
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system

#install container runtime(CRI-O)
source install-container-runtime.sh
source intall-kubelet.sh