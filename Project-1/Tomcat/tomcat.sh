#!/bin/bash

Tomcat_url="https://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.60/bin/apache-tomcat-8.5.60.tar.gz"
cd /opt/
echo "Download Tomcat"
wget $Tomcat_url
echo "Extract Tomcat file"
tar xvf apache-tomcat-8.5.60.tar.gz
echo "Change Directory name"
mv apache-tomcat-8.5.60 tomcat-8
echo "Start Tomcat server"
bash /opt/tomcat-8/bin/startup.sh
