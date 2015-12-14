# Ubuntu 14.04，Trusty Tahr（可靠的塔尔羊）发行版
FROM ubuntu:trusty
# Michael 到处借鉴编写的
MAINTAINER Michael Han <contact@hanfeng.name>

# 修改为阿里云镜像源，加快速度
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse" > /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list

# APT 自动安装 PHP 相关的依赖包，如需其他依赖包在此添加
RUN apt-get update \
    && apt-get -y install \
        curl \
        wget \
        vim \
    	openssh-server \
        git \
	tree
    # LNMP
	nginx \
	mysql-server-5.6 \
	php5-cli \
	php5-gd \
	php5-fpm \
	php5-mysql \
    # Nginx Configure

    # 用完包管理器后安排打扫卫生可以显著的减少镜像大小
   # && apt-get clean \
   # && apt-get autoclean \
   # && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \

    # 安装 Composer，此物是 PHP 用来管理依赖关系的工具
    # Laravel Symfony 等时髦的框架会依赖它
    && curl -sS https://getcomposer.org/installer \
        | php -- --install-dir=/usr/local/bin --filename=composer
    # 加速
    && composer config -g repositories.packagist composer http://packagist.phpcomposer.com \
    # Install Drupal  Drush
    && export PATH="$HOME/.composer/vendor/bin:$PATH" \  
    && composer global require drush/drush \
    # Install Coder
    && composer global require drupal/coder \

    # Web Dir
    && mkdir -p /app \ 
    && chown -R www-data:www-data /app \
Add ./puppet/nginx/ /etc/nginx/sites-available

RUN service nginx reload && service php5-fpm restart


WORKDIR /app

EXPOSE 80
EXPOSE 443
EXPOSE 22
