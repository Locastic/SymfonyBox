php -d memory_limit=-1 vagrant/app/console cache:clear --env=dev --no-debug
php -d memory_limit=-1 vagrant/app/console assetic:dump --env=dev --no-debug