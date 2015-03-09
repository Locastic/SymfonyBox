sudo rm -rf /srv/cache/*
sudo rm -rf /srv/logs/*
sudo rm -rf /vagrant/app/cache
sudo rm -rf /vagrant/app/logs
ln -s /srv/cache /vagrant/app/cache
ln -s /srv/cache /vagrant/app/logs
