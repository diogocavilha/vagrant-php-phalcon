# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "boxname"
    config.vm.synced_folder "/www", "/www"
    config.vm.synced_folder "./", "/temp"
    config.vm.network :private_network, ip: "192.168.0.10"
    # config.vm.network "forwarded_port", guest: 80, host: 8080
    # config.vm.network "forwarded_port", guest: 8015, host: 8015
    # config.vm.network "forwarded_port", guest: 8030, host: 8030

    config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "512"]
    end

    config.vm.provision :shell, :path => "scripts/init.sh"
    config.vm.provision :shell, :path => "scripts/system_packages.sh"
    config.vm.provision :shell, :path => "scripts/frontend_packages.sh"
    config.vm.provision :shell, :path => "scripts/git.sh"
    config.vm.provision :shell, :path => "scripts/nginx.sh"
    config.vm.provision :shell, :path => "scripts/php.sh"
    config.vm.provision :shell, :path => "scripts/phalcon.sh"
    config.vm.provision :shell, :path => "scripts/mysql.sh"
    config.vm.provision :shell, :path => "scripts/envvars.sh"
    config.vm.provision :shell, :path => "scripts/postinstall.sh"
end
