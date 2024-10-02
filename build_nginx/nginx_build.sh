#!/usr/bin/env bash

func_install () {
	mv default ~/
	mv info.php ~/
	apt update -y
	apt install nginx -y
	apt install php-fpm -y
	cp ~/default /etc/nginx/sites-available/
	systemctl restart nginx
	mv info.php /var/www/html/
	rm -f ~/default
	rm -f ~/info.php
}


sudo func_install
