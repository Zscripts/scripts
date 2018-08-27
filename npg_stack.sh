#!/bin/bash
# ******************************************
# Program: NPG Stack Installation Script
# Developer: r00t
# ******************************************

if [ "`lsb_release -is`" == "Ubuntu" ] || [ "`lsb_release -is`" == "Debian" ] || [ "`lsb_release -is`" == "Parrot" ] || [ "`lsb_release -is`" == "Kali" ]
then

	#Essentials
	sudo apt-get -y install nano wget git;

#	sudo apt-get -y install mysql-server mysql-client mysql-workbench libmysqld-dev;
	sudo apt-get -y install postgresql-9.6 postgresql-client-9.6;
	sudo systemctl enable postgresql.service;
	sudo systemctl start postgresql.service;

#	sudo apt-get -y install apache2 php5 libapache2-mod-php5 php5-mcrypt phpmyadmin;
#	sudo chmod 755 -R /var/www/;
#	sudo printf "<?php\nphpinfo();\n?>" > /var/www/html/info.php;
#	sudo service apache2 restart;

	#Nginx Installation
	sudo apt-get -y install nginx;
	sudo systemctl enable nginx;

	#Golang Installation
	wget https://dl.google.com/go/go1.10.1.linux-amd64.tar.gz;
	tar -xvf go1.10.1.linux-amd64.tar.gz;
	sudo mv go /usr/local/;
	export GOROOT=/usr/local/go;
	mkdir $HOME/go;
	export GOPATH=$HOME/go;
	export PATH=$GOPATH/bin:$GOROOT/bin:$PATH;
	sudo source ~/.profile;




#elif [ "`lsb_release -is`" == "CentOS" ] || [ "`lsb_release -is`" == "RedHat" ]
#then
#	sudo yum -y install httpd mysql-server mysql-devel php php-mysql php-fpm;
#	sudo yum -y install epel-release phpmyadmin rpm-build redhat-rpm-config;
#	sudo yum -y install mysql-community-release-el7-5.noarch.rpm proj;
#	sudo yum -y install tinyxml libzip mysql-workbench-community;
#	sudo chmod 755 -R /var/www/;
#	sudo printf "<?php\nphpinfo();\n?>" > /var/www/html/info.php;
#	sudo service mysqld restart;
#	sudo service httpd restart;
#	sudo chkconfig httpd on;
#	sudo chkconfig mysqld on;

elif [ "`lsb_release -is`" == "FreeBSD" ]
then
	#Editionals
	sudo pkg -y install nano wget git mercurial bzr;

	#Golang Installation

	cd /tmp;
	wget https://dl.google.com/go/go1.10.1.freebsd-amd64.tar.gz;
	tar -C /usr/local -xzf go1.10.1.freebsd-amd64.tar.gz;
	mkdir ~/go;
	setenv GOPATH /$USER/go;
	set path = ($path /usr/local/go/bin /$USER/go/bin);

	#echo "setenv GOPATH /$USER/go" >> ~/.cshrc
	#echo "set path = ($path /usr/local/go/bin /$USER/go/bin)" >> ~/.cshrc
	sudo source ~/.profile;

	#Postgresql Installation

	sudo pkg -y install postgresql96-server postgresql96-client;
	sudo sysrc postgresql_enable=yes;
	sudo service postgresql initdb;
	sudo service postgresql start;

	#Nginx Installation

	sudo pkg -y install nginx;
	sudo sysrc nginx_enable=yes;


else
	echo "Unsupported Operating System";
fi
