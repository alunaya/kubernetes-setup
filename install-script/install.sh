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

#disable swap
swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab


#init kubeadm
# kubeadm init --pod-network-cidr=10.217.0.0/16 --apiserver-advertise-address=192.168.0.3 -v=5

# mkdir -p $HOME/.kube
# sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
# sudo chown $(id -u):$(id -g) $HOME/.kube/config

source install-cilium.sh

#join workernode
kubeadm join 192.168.0.3:6443 --token gkm4re.cq3wscabntzcxjmm \
        --discovery-token-ca-cert-hash sha256:44578e59228aec56593bf62c79810102fe20eb50c023483adb12541e33730673