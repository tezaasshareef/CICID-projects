#!/bin/bash
apt-get -y update
apt-get install -y apt-transport-https wget gnupg python3 python3-pip python-dev tree libpq-dev
update-alternatives --install /usr/bin/python python /usr/bin/python3 1
pip3 install ansible
apt-get install -y docker.io
apt-get install npm
npm install -y npm --global
pip3 install docker-compose
apt install -y pwgen
mkdir /downloads
cd /downloads
git clone https://github.com/betawins/awx.git
cd /downloads/awx/installer
var=`pwgen -N 1 -s 30`
echo $var
sed -i 's/awxsecret/'$var'/g' /downloads/awx/installer/inventory
echo "[all]" >> inventory
echo "localhost" >> inventory
ansible-playbook -i inventory install.yml
reboot
