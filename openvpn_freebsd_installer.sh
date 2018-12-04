#!/bin/bash
#Scripted by r00t
#Feel free to use, redistribute and credit the shitty person who spent a few minutes writing this.
#use on FreeBSD. For other distributions you need to edit a few lines.



printf
"
   ____                 _    ______  _   __
  / __ \____  ___  ____| |  / / __ \/ | / /
 / / / / __ \/ _ \/ __ \ | / / /_/ /  |/ / 
/ /_/ / /_/ /  __/ / / / |/ / ____/ /|  /  
\____/ .___/\___/_/ /_/|___/_/   /_/ |_/   
    /_/                              -r00t      

This script is only for freebsd.
Before running this script make sure that your system is upgraded.
Execute with root privileges.
This script will generate 61 users with random passwords and pam user/pass only authentication.
"
pwd_mkdb /etc/master.passwd;
sudo pkg -y install openvpn;
mkdir /usr/local/etc/openvpn;
cp -r /usr/local/share/easy-rsa /usr/local/etc/openvpn/easy-rsa;
echo"
port 50983
askpass
proto udp
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh.pem
server 10.8.0.0 255.255.255.0
keepalive 10 120
comp-lzo
persist-key
persist-tun
client-cert-not-required
plugin /usr/local/lib/openvpn/plugins/openvpn-plugin-auth-pam.so login
status openvpn-status.log verb 3
push "redirect-gateway autolocal def1"
push "redirect-gateway local def1"
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4" 

" > /usr/local/etc/openvpn/openvpn.conf;

cd /usr/local/etc/openvpn/easy-rsa;
./easyrsa.real init-pki;
./easyrsa.real build-ca;
./easyrsa.real build-server-full openvpn-server nopass;
./easyrsa.real gen-dh;

cp pki/dh.pem \
           pki/ca.crt \
           pki/issued/openvpn-server.crt \
           pki/private/openvpn-server.key \
           /usr/local/etc/openvpn;

cd .. ;
mv openvpn-server.crt server.crt;
mv openvpn-server.key server.key;
sysrc openvpn_enable="YES";
sysrc openvpn_if="tun";
service openvpn start;

read -p 'Enter number of users: ' users;


echo "foreach n (`seq -f 'egg%04g' 1 $users`)
    pw useradd $n -s /sbin/nologin -w random
end" >> pwuser.csh;

set -x
csh pwuser.csh;


