echo -e "\e[31minstalling maven\e[0m"
yum install maven -y &>>/tmp/roboshop.log

echo -e "\e[31muser add\e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[31mremoving and creating\e[0m"
rm -rf /app &>>/tmp/roboshop.log
mkdir /app  &>>/tmp/roboshop.log

echo -e "\e[31mextracting config file\e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip  &>>/tmp/roboshop.log
cd /app &>>/tmp/roboshop.log
unzip /tmp/shipping.zip &>>/tmp/roboshop.log

echo -e "\e[31mDownloading dependencies\e[0m"
cd /app  &>>/tmp/roboshop.log
mvn clean package  &>>/tmp/roboshop.log
mv target/shipping-1.0.jar shipping.jar &>>/tmp/roboshop.log

echo -e "\e[31minstalling serivce\e[0m"
cp /home/centos/roboshop-shell/shipping.service /etc/systemd/system/shipping.service  &>>/tmp/roboshop.log

echo -e "\e[31mRestarting services\e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable shipping &>>/tmp/roboshop.log
systemctl start shipping &>>/tmp/roboshop.log

echo -e "\e[31minstalling mysql\e[0m"
yum install mysql -y  &>>/tmp/roboshop.log

echo -e "\e[31mMysql passwordassigning\e[0m"
mysql -h mysql-dev.devops89.site -uroot -pRoboShop@1 < /app/schema/shipping.sql &>>/tmp/roboshop.log

echo -e "\e[31mRestarting\e[0m"
systemctl restart shipping &>>/tmp/roboshop.log
