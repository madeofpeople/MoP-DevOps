#! /bin/bash

cd /var/www/html/wp-content
composer update
composer install
composer build