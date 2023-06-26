echo -e "\e[31minstalling golang\e[0m"
yum install golang -y  &>>/tmp/roboshop.log

echo -e "\e[31muser ading\e[0m"
useradd roboshop  &>>/tmp/roboshop.log

echo -e "\e[31mremoving and adding dir\e[0m"
rm -rf /app   &>>/tmp/roboshop.log
mkdir /app    &>>/tmp/roboshop.log

echo -e "\e[31mdownloading application \e[0m"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip   &>>/tmp/roboshop.log
cd /app   &>>/tmp/roboshop.log
unzip /tmp/dispatch.zip   &>>/tmp/roboshop.log

echo -e "\e[31mdownlaod dependencies\e[0m"
cd /app   &>>/tmp/roboshop.log
go mod init dispatch   &>>/tmp/roboshop.log
go get   &>>/tmp/roboshop.log
go build   &>>/tmp/roboshop.log

echo -e "\e[31minstalling serivce\e[0m"
cp /home/centos/roboshop-shell/dispatch.service /etc/systemd/system/dispatch.service  &>>/tmp/roboshop.log  &>>/tmp/roboshop.log

echo -e "\e[31mrestarting\e[0m"
systemctl daemon-reload   &>>/tmp/roboshop.log
systemctl enable dispatch   &>>/tmp/roboshop.log
systemctl start dispatch   &>>/tmp/roboshop.log
