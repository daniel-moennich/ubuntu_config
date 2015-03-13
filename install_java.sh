#!/bin/bash

# This script takes as a parameter the Oracle Java tar file, extracts it and sets it as the current
# Java installation.

opt_java_dir="/opt/Oracle_Java"


if [[ ! -f $1 ]]; then
	echo "Location of Oracle Java tar file needs to be specified."
	exit 1
fi


if [[ ! -d $opt_java_dir ]]; then
	echo "Creating directory ${opt_java_dir}"
	sudo mkdir $opt_java_dir
fi


java_dir=`tar -tf ${1} | head -1 | sed -e 's/\/.*//'`
echo "this is the java directory: ${java_dir}"


echo "Extracting archive to ${opt_java_dir}"
sudo tar -xf $1 -C $opt_java_dir



sudo update-alternatives --install "/usr/bin/java" "java" "${opt_java_dir}/${java_version}/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "${opt_java_dir}/${java_version}/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "${opt_java_dir}/${java_version}/bin/javaws" 1
sudo update-alternatives --install "/usr/bin/jar" "jar" "${opt_java_dir}/${java_version}/bin/jar" 1


sudo update-alternatives --set "java" "${opt_java_dir}/${java_version}/bin/java"
sudo update-alternatives --set "javac" "${opt_java_dir}/${java_version}/bin/javac"
sudo update-alternatives --set "javaws" "${opt_java_dir}/${java_version}/bin/javaws"
sudo update-alternatives --set "jar" "${opt_java_dir}/${java_version}/bin/jar"

