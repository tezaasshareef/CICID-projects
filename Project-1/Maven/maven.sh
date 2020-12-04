#!/bin/bash

echo "install maven"
apt install -y maven

echo "check maven version"
mvn --version

echo "defualt maven path is: /usr/share/maven"
