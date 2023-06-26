echo -e "\e[31mInstalling nginx server\e[0m"
yum install nginx -y >/tmp/roboshop.log

echo -e "\e[31mremoving old content\e[0m"
rm -rf /usr/share/nginx/html/* >/tmp/roboshop.log

echo -e "\e[31mdownloading content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip >/tmp/roboshop.log 2>/tmp/error.log

echo -e "\e[31mextracting nginx server\e[0m"
cd /usr/share/nginx/html >/tmp/roboshop.log
unzip /tmp/frontend.zip  >/tmp/roboshop.log

##need to configure fine

echo -e "\e[31mrestarting nginx server\e[0m"
systemctl enable nginx   >/tmp/roboshop.log
systemctl restart nginx  >/tmp/roboshop.log