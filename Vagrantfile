VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "puppetlabs/centos-6.5-64-nocm"
  config.vm.box_url = "https://vagrantcloud.com/puppetlabs/centos-6.5-64-nocm"

  config.vm.network :private_network, ip: "192.168.19.50"
  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |v| 
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    v.customize ["modifyvm", :id, "--memory", 1524]
    v.customize ["modifyvm", :id, "--name", "loca-vm"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
    v.customize ["modifyvm", :id, "--cpus", 2]
  end

  # FSC is for cachefilesd
  config.vm.synced_folder "./application/test.app", "/vagrant", type: "nfs" , mount_options: ['fsc']

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
  end

end
