echo -e "\e[31mdisabling old mysql\e[0m"
yum module disable mysql -y

echo -e "\e[31mcopying mysql repo\e[0m"
cp /home/centos/roboshop-shell/mysql.repo /etc/yum.repos.d/mysql.repo  &>>/tmp/roboshop.log

echo -e "\e[31minstalling mysql server\e[0m"
yum install mysql-community-server -y

echo -e "\e[31mrestarting\e[0m"
systemctl enable mysqld
systemctl start mysqld

echo -e "\e[31msetting password\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1

echo -e "\e[31mcopying mysql repo\e[0m"
mysql -uroot -pRoboShop@1