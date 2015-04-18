# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "chef/centos-6.6"
  config.vm.box_url = "https://atlas.hashicorp.com/chef/boxes/centos-6.6/versions/1.0.0/providers/virtualbox.box"

  config.vm.define "server" do |server|
   server.vm.provider "virtualbox" do |vb|
      vb.customize [
        "modifyvm", :id,
        "--name", "server",
        "--memory", "1024"
      ]
    end
    server.vm.provision "ansible" do |ansible|
      ansible.host_key_checking = false
      ansible.playbook = "./ansible/site.yml"
    end
    server.vm.network "private_network", ip: "192.168.35.10"
  end

end
