sudo rm -rf /srv/cache/*
sudo rm -rf /srv/logs/*
rm -rf /vagrant/app/bootstrap.php.cache
(cd /vagrant; php -d memory_limit=-1 /vagrant/composer.phar install)
