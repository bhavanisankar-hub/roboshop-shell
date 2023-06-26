echo -e "\e[31mconfiguring node js repo\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash  &>>/tmp/roboshop.log

echo -e "\e[31minstallingnode js\e[0m"
yum install nodejs -y  &>>/tmp/roboshop.log

echo -e "\e[31madding dir\e[0m"
useradd roboshop  &>>/tmp/roboshop.log

echo -e "\e[31mremoving old one and creating new appdir\e[0m"
rm -rf /app  &>>/tmp/roboshop.log
mkdir /app   &>>/tmp/roboshop.log

echo -e "\e[31mextracting content\e[0m"
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip

echo -e "\e[31minstalling o\e[0m"
cd /app &>>/tmp/roboshop.log
npm install   &>>/tmp/roboshop.log

echo -e "\e[31minstalling serivce\e[0m"
cp /home/centos/roboshop-shell/user.service /etc/systemd/system/user.service  &>>/tmp/roboshop.log

echo -e "\e[31mrestrating\e[0m"
systemctl daemon-reload   &>>/tmp/roboshop.log
systemctl enable user   &>>/tmp/roboshop.log
systemctl start user   &>>/tmp/roboshop.log

echo -e "\e[31mcopymmanodb repo\e[0m"
cp /home/centos/roboshop-shell/mongodb.repo /etc/yum.repos.d/mongodb.repo  &>>/tmp/roboshop.log

echo -e "\e[31minstalling mango db\e[0m"
yum install mongodb-org-shell -y   &>>/tmp/roboshop.log

echo -e "\e[31mmangodb scema\e[0m"
mongo --host mongodb-dev.devops89.site </app/schema/user.js  &>>/tmp/roboshop.log