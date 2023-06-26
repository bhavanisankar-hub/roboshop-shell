echo -e "\e[31minstallinn redisrepo\e[0m"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y  &>>/tmp/roboshop.log

echo -e "\e[31menabling redis\e[0m"
yum module enable redis:remi-6.2 -y  &>>/tmp/roboshop.log

echo -e "\e[31minstalling redis\e[0m"
yum install redis -y  &>>/tmp/roboshop.log

echo -e "\e[31mupdate redis listen adress\e[0m"
sed -e 's/127.0.0.1/0.0.0.0/' /etc/redis.conf /etc/redis/redis.conf  &>>/tmp/roboshop.log

echo -e "\e[31mrestarting\e[0m"
systemctl enable redis  &>>/tmp/roboshop.log
systemctl start redis   &>>/tmp/roboshop.log