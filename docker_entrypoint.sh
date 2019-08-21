#!/bin/bash

if [[ `ls -lq /var/www/html/generated | wc -l` -le  1 ]]; then
	echo "no prior installation detected"

	echo "editing files..."
	sed -iE 's/#RewriteBase \/magento\/pub\/static/RewriteBase \/pub\/static/' /var/www/html/pub/static/.htaccess 

	echo "starting apache..."
	apachectl

	# Lazy wait for db container
	sleep 15

	php /var/www/html/bin/magento setup:install \
	--base-url=http://127.0.0.1:8000/ \
	--db-host=db \
	--db-name=magento \
	--db-user=root \
	--db-password=letmein \
	--backend-frontname=admin \
	--admin-firstname=admin \
	--admin-lastname=admin \
	--admin-email=admin@admin.com \
	--admin-user=admin \
	--admin-password=admin123 \
	--language=en_GB \
	--currency=GBP \
	--timezone=Europe/London \
	--use-rewrites=1

	chmod -R 777 /var/www/html
else
	echo "previous installation detected"
	# Temp fix for apache shared memory problem
	rm -rf /run/httpd && mkdir /run/httpd
	echo "starting apache..."
	apachectl
fi

tail -f /var/log/httpd/access_log
