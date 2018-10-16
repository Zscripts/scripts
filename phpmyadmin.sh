sudo apt-get install phpmyadmin php-mbstring php-gettext;
sudo phpenmod mcrypt;
sudo phpenmod mbstring;
sudo systemctl restart apache2;

#enable the use of .htaccess file overrides by editing our Apache configuration file.
#sudo nano /etc/apache2/conf-available/phpmyadmin.conf
#<Directory /usr/share/phpmyadmin>
#    Options FollowSymLinks
#    DirectoryIndex index.php
#    AllowOverride All
#sudo systemctl restart apache2
#sudo nano /usr/share/phpmyadmin/.htaccess
#AuthType Basic
#AuthName "Restricted Files"
#AuthUserFile /etc/phpmyadmin/.htpasswd
#Require valid-user

#create initial user
#	sudo htpasswd -c /etc/phpmyadmin/.htpasswd username
# for additional user repeate above command without "-c" flag

