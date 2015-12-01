# Michael Drupal8 Dockerfile


- Dockerfile
- nginx - drupal8.conf

- mysql

	`sudo docker run --name some-mysql -v /web/data1:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=111 -d mysql`
	
	`sudo docker inspect some-mysql`
	
	`mysql -uroot -p111 -h 172.16.0.2`
- web server

	`sudo docker run --name drupal8 --link some-mysql:mysql -v /web/drupal8:/app/ -it qthhanfeng/u0`

# Useful Command

- docker ps -l
- docker inspect some-mysql
- docker attach some-mysql

Ctrl + P, Ctrl + Q

# READ  Drupal's ReadMe

