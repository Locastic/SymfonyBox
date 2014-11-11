VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "symfonyBox"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"

  config.vm.network :private_network, ip: "192.168.19.50"
  config.ssh.forward_agent = true

  config.vm.provision :shell, inline: "if [ ! $(grep single-request-reopen /etc/sysconfig/network) ]; then echo RES_OPTIONS=single-request-reopen >> /etc/sysconfig/network && service network restart; fi"

  config.vm.provider :virtualbox do |v| 
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 1024]
    v.customize ["modifyvm", :id, "--name", "symfonyBox"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
    v.customize ["modifyvm", :id, "--cpus", 2]
  end

  config.vm.synced_folder "./application/kladise.net", "/vagrant", type: "nfs", id: "vagrant-root"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
  end

end
