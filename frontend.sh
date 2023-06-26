echo -e "\e[31mInstalling nginx server\e[0m"
yum install nginx -y

echo -e "\e[31mremoving old content\e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[31mdownloading content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[31mextracting nginx server\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

echo -e "\e[31mconfiguring nginx server\e[0m"

echo -e "\e[31mrestarting nginx server\e[0m"
systemctl enable nginx
systemctl restart nginx