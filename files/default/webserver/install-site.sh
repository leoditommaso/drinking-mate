#!/bin/bash

cd /opt/applications
if [ -e wordpress ]; then
  cd wordpress
  git pull
else
  git clone https://github.com/leoditommaso/drinking-mate-files.git wordpress
fi
chown -R www-data.www-data /opt/applications/wordpress
mysqladmin -uroot -prootpass drop wordpress
mysqladmin -uroot -prootpass create wordpress
mysql -uroot -prootpass wordpress < /opt/applications/wordpress/sql/wordpress.sql
