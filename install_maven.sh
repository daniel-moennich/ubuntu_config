#!/bin/bash


if [[ ! -f $1 ]]; then
	echo "Please give the Maven archive location as a parameter."
	exit 1
fi

maven_parent_dir="/usr/local/apache-maven"

# get top level name in archive with tar
maven_dir=`tar -tf ${1} | head -1 | sed -e 's/\/.*//'`


if [[ ! -d $maven_parent_dir ]]; then
	sudo mkdir $maven_parent_dir
fi


# extract to /usr/local/apache-maven
sudo tar -xf $1 -C $maven_parent_dir

# add to PATH with adding export line in .bashrc file
echo "export PATH=\"\$PATH:${maven_parent_dir}/${maven_dir}/bin\"" >> ~/.bashrc




