#!bin/bash


# Create local IP variable and bind to show default local interface IP
mylocalip=$(sudo ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)

docker pull mariadb

# docker run --name some-mysql -p 8094:8080 -e MYSQL_ROOT_PASSWORD=8108453500! -d mysql

docker run -it --name some-mysql -p 8094:8080 --rm mariadb mysql -hsome-mariadb -admin -p

echo
echo
echo ----------------- Wordpress URLS---------------------------
echo
echo Local Address: "$mylocalip:8091" or "localhost:8091"
echo
echo -------------------------------------------------------------------
echo
echo
echo Finished!
