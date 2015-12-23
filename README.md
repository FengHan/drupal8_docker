# Vagrant + Docker + Puppet Best Practise

## Ubuntu Sourcelist
- http://wiki.ubuntu.org.cn/源列表

## Docker. 
- https://dashboard.daocloud.io/mirror

- curl -sSL https://get.daocloud.io/docker | sh
- sudo service docker status
- curl -sSL https://get.daocloud.io/daomonit/install.sh | sh -s a805c99cf82d47faed274dfabc79a7449aa1d8bf 
- sudo usermod -aG docker vagrant
- dao pull ubuntu
- dao pull smerrill/vagrant-ubuntu-trusty-puppet

## Vagrant

# Michael Drupal8 Dockerfile


- Dockerfile
- nginx - drupal8.conf

- mysql

	`sudo docker run --name some-mysql -v /web/data1:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=111 -d mysql`
	
	`sudo docker inspect some-mysql`
	
	`mysql -uroot -p111 -h 172.16.0.2`
- web server

	`sudo docker run --name drupal8 --link some-mysql:mysql -v /web/drupal8:/app/ -it qthhanfeng/u0`
- Start Server
	`sudo docker start some-mysql`
	`sudo docker start drupal8`

# Useful Command

- docker ps -l
- docker inspect some-mysql
- docker attach some-mysql

Ctrl + P, Ctrl + Q

# READ  Drupal's ReadMe
 `chown www-data www-data -R /app`


# Symfony2 Install

-  Install the symfony installer

  `wget http://symfony.com/installer`

 `mv installer /usr/local/bin/symfony`


  `chmod a+x /usr/local/bin/symfony` 

- 

  `symfony new my_project`
  `symfony new my_project 2.8`
  `chown -R www-data:www-data my_project`
# Delete all docke container
- docker 删除基于镜像的所有容器：

    `sudo docker ps -a | awk '{ print $1,$2 }' | grep  这里是镜像的名称| awk '{print $1 }' | xargs -I {} sudo docker rm {}`


- 删除所有包含hanfeng 的镜像

sudo docker images | awk '{ print $1,$2 }' | grep hanfeng| awk '{print $1 }' | xargs -I {} sudo docker rmi {}
