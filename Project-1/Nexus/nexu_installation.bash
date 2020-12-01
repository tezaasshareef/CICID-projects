#!/bin/bash
cd /opt
echo "Download Nexus tar file"
wget http://download.sonatype.com/nexus/3/nexus-3.22.0-02-unix.tar.gz
echo "Extract the tar file"
tar -xvf nexus-3.22.0-02-unix.tar.gz
echo "Rename the nexus tar file to nexus"
mv nexus-3.22.0-02 nexus
echo "make user changes in nexus.rc"
sed -i 's/#run_as_user=""/run_as_user="root"/' /opt/nexus/bin/nexus.rc
echo "Modify memory settings"
sed -i 's/2703/512/' /opt/nexus/bin/nexus.vmoptions
echo "copy nexus.service file"
cp /root/nexus.service /etc/systemd/system
echo "start nexus service"
serv=nexus
sstat=$(pidof $serv | wc -l )
if [ $sstat -gt 0 ]
then
echo "$serv running!!"
else
systemctl start $serv
echo "$serv service is UP now!!!"
fi
echo "you can access it in the browser by
URL — http://public_dns_name:8081"
