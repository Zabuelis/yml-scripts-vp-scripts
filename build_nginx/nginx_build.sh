#!/usr/bin/env bash

func_install () {
	apt update -y
	apt install nginx -y
	apt install php-fpm -y
	mv default /etc/nginx/sites-available/
	systemctl restart nginx
	mv info.php /var/www/html/
	mv ./renamed_html_files /var/www/html/
}


func_install
