#!/bin/bash
echo "Import Docker GPG key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "add Docker APT repository"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo "update system and install Docker CE"
sudo apt -y update && sudo apt -y install docker-ce
echo "Check docker version"
docker version
echo "Add user to docker group"
sudo usermod -aG docker $USER
echo "Download openshift"
wget https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
echo "Extract the tar file"
tar xvf openshift-origin-client-tools*.tar.gz
echo "Switch to created folder and copy kubectl and oc binaries to the /usr/local/bin"
cd openshift-origin-client*/
sudo mv  oc kubectl  /usr/local/bin/
echo "verify the OC version"
oc version
echo "Allow user of insecure Docker Registry"
cat << EOF | sudo tee /etc/docker/daemon.json 
 {
     "insecure-registries" : [ "172.30.0.0/16" ]
 }
EOF
echo "Restart Docker service"
sudo systemctl restart docker
echo "Start OKD server"
oc cluster up --public-hostname=192.168.1.211
