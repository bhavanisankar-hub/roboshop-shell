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
curl -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip  &>>/tmp/roboshop.log
cd /app  &>>/tmp/roboshop.log
unzip /tmp/cart.zip   &>>/tmp/roboshop.log

echo -e "\e[31minstalling o\e[0m"
cd /app &>>/tmp/roboshop.log
npm install   &>>/tmp/roboshop.log

echo -e "\e[31minstalling serivce\e[0m"
cp /home/centos/roboshop-shell/cart.service /etc/systemd/system/cart.service  &>>/tmp/roboshop.log

echo -e "\e[31mrestrating\e[0m"
systemctl daemon-reload   &>>/tmp/roboshop.log
systemctl enable cart   &>>/tmp/roboshop.log
systemctl start cart   &>>/tmp/roboshop.log