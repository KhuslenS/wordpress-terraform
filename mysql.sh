#!/usr/bin/env bash

yum -y install mariadb-server mariadb
 systemctl start mariadb.service
  systemctl enable mariadb.service

mysql_secure_installation
read -p "Enter a database name " dbname
read -p "Press enter and provide your root user's password"
mysql -u root -p "$rootpassword" -e "CREATE DATABASE $dbname "
read -p "Enter database user name :" dbuser
read -p "Enter password for the user $dbuser " dbuserpassword
read -p "Press enter and provide your root user's password one more time"
mysql -u root -p"$rootpassword" -e "GRANT ALL on $dbname.* to $dbuser identified by '$dbuserpassword' "
#This will sync your database information to your wordpress (database establishment)
sed -i "/DB_NAME/s/'[^']*'/'$dbname'/2" /var/www/html/wp-config.php
sed -i "/DB_USER/s/'[^']*'/'$dbuser'/2" /var/www/html/wp-config.php
sed -i "/DB_PASSWORD/s/'[^']*'/'$dbuserpassword'/2" /var/www/html/wp-config.php
#This will start apache and mariadb
systemctl enable httpd
systemctl restart httpd
systemctl enable mariadb
systemctl restart mariadb
