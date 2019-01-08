# 定义安装版本
export docker_version=17.03.2
# step 1: 安装必要的一些系统工具
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common bash-completion
# step 2: 安装GPG证书
sudo curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
# Step 3: 写入软件源信息
sudo add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
# Step 4: 更新并安装 Docker-CE
sudo apt-get -y update
version=$(apt-cache madison docker-ce|grep ${docker_version}|awk '{print $3}')
# --allow-downgrades 允许降级安装
sudo apt-get -y install docker-ce=${version} --allow-downgrades
# 设置开机启动
sudo gpasswd -a vagrant docker

sudo service docker restart

newgrp - docker

sudo systemctl enable docker
