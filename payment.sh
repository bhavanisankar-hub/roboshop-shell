echo -e "\e[31menabling redis\e[0m"
yum install python36 gcc python3-devel -y  &>>/tmp/roboshop.log

echo -e "\e[31museradding\e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[31mmaking directory\e[0m"
rm -rf /app &>>/tmp/roboshop.log
mkdir /app  &>>/tmp/roboshop.log

echo -e "\e[31mExtracting file\e[0m"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip  &>>/tmp/roboshop.log
cd /app  &>>/tmp/roboshop.log
unzip /tmp/payment.zip  &>>/tmp/roboshop.log

echo -e "\e[31mDownloading dependencies\e[0m"
cd /app   &>>/tmp/roboshop.log 
pip3.6 install -r requirements.txt  &>>/tmp/roboshop.log

echo -e "\e[31minstalling serivce\e[0m"
cp /home/centos/roboshop-shell/payment.service /etc/systemd/system/payment.service  &>>/tmp/roboshop.log

echo -e "\e[31mRestarting\e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable payment  &>>/tmp/roboshop.log
systemctl start payment  &>>/tmp/roboshop.log
