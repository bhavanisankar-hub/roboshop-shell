echo -e "\e[31minstalling golang\e[0m"
yum install golang -y

echo -e "\e[31muser ading\e[0m"
useradd roboshop

echo -e "\e[31mremoving and adding dir\e[0m"
rm -rf /app
mkdir /app 

echo -e "\e[31mdownloading application \e[0m"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip 
cd /app 
unzip /tmp/dispatch.zip

echo -e "\e[31mdownlaod dependencies\e[0m"
cd /app 
go mod init dispatch
go get 
go build

echo -e "\e[31minstalling serivce\e[0m"
cp /home/centos/roboshop-shell/dispatch.service /etc/systemd/system/dispatch.service  &>>/tmp/roboshop.log

echo -e "\e[31mrestarting\e[0m"
systemctl daemon-reload
systemctl enable dispatch 
systemctl start dispatch
