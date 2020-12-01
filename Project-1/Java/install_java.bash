#!/bin/bash

echo "update your vm"
apt-get update

echo "Installing java version 8"
apt install openjdk-8-jdk

echo "check java version"
java -version

echo "export java varaibales"

export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/bin/java"

echo "Restart source file"
source /etc/environment
echo "check JAVA_HOME path"
echo $JAVA_HOME
