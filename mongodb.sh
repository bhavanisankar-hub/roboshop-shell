echo -e "\e[31mcopying mongodb repo\e[0m"
cp mongodb.repo /etc/yum.repos.d/mongodb.repo  &>>/tmp/roboshop.log

echo -e "\e[31minstallign mongodb server\e[0m"
yum install mongodb-org -y  &>>/tmp/roboshop.log

echo -e "\e[31mupdate mangodb listen adress\e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongodb.conf

echo -e "\e[31mrestarting\e[0m"
systemctl enable mongod   &>>/tmp/roboshop.log
systemctl start mongod &>>/tmp/roboshop.log