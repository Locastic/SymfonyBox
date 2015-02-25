sudo rm -rf /srv/cache/*
sudo rm -rf /srv/logs/*
sudo rm -rf /vagrant/app/cache
sudo rm -rf /vagrant/app/logs
ln -s /srv/cache /vagrant/app/cache
ln -s /srv/cache /vagrant/app/logs
php  /vagrant/app/console cache:clear
sudo rm -rf /vagrant/app/c
sudo cp -r /srv/cache /vagrant/app/c
sudo chmod -R 777 /srv
sudo rm -rf /srv/cache/*
echo c >> /vagrant/.gitignore