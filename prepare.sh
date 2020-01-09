
# only support centos 7 now
# epel
yum install -y epel-release
yum makecache
# install docker
curl -fsSL https://get.docker.com | bash -s
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
systemctl enable docker && systemctl start docker

# haveged
yum install -y haveged && systemctl enable haveged && systemctl start haveged

# install git and the_silver_searcher
yum install -y git the_silver_searcher

# disable selinux
setenforce 0
sed -i "s|SELINUX=enforcing|SELINUX=permissive|g" /etc/selinux/config
# disable firewalld
systemctl disable firewalld
