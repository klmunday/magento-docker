From centos:7

RUN yum -y update && \
yum -y upgrade

RUN yum -y install wget \
gzip \
lsof \
mysql \
mysqldump \
nice \
sed \
tar \
epel-release \
yum-utils

RUN yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
yum-config-manager --enable remi-php72 && \
yum -y update

RUN yum -y install php \
php-pdo \
php-mysqlnd \
php-opcache \
php-xml \
php-gd \
php-devel \
php-mysql \
php-intl \
php-mbstring \
php-json \
php-iconv \
php-soap \
php-zip \
php-bcmath

RUN sed -iE 's/memory_limit = .*/memory_limit = 2048M/' /etc/php.ini && \
sed -iE 's/max_execution_time = .*/max_execution_time = 600/' /etc/php.ini && \
sed -iE 's/AllowOverride None/AllowOverride All/g' /etc/httpd/conf/httpd.conf && \
chmod -R 777 /var/www/html && \
chown -R root:apache /run/httpd

ADD docker_entrypoint.sh /scripts/docker_entrypoint.sh

CMD ["./scripts/docker_entrypoint.sh"]
