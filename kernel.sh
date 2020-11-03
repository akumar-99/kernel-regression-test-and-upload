#!/bin/bash
read -p 'Username: ' uservar
read -sp 'Password: ' passvar
sudo dnf install gcc git python3-fedora make libtirpc libtirpc-devel policycoreutils-python-utils -y
flag=`python3 ./authentication.py $uservar $passvar`
if [[ $flag == 0 ]] ; then
	echo "AUTHENTICATION FAILED"
elif [[ $flag == 200 ]] ; then
	echo "AUTHENTICATION SUCCESSFUL"
	git clone https://pagure.io/kernel-tests.git
	sudo semanage boolean -m --on selinuxuser_execheap
	cd kernel-tests
	cp config.example .config
	sed -i 's/submit=none/submit=authenticated/g' .config 
	sed -i "s/#username=''/username=\'$uservar\'/g" .config 
	sed -i "s/#password=''/password=\'$passvar\'/g" .config
	sudo ./runtests.sh
	sudo ./runtests.sh -t performance
	sudo semanage boolean -m --off selinuxuser_execheap
	cd ..
	rm -rf kernel-tests
fi
