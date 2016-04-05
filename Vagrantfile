require 'yaml'

configuration = YAML.load_file('config.yaml')

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = configuration["box"]
    config.vm.hostname = configuration["hostname"]

    config.vm.synced_folder configuration["projects-folder"], "/www", create: true, group: "www-data", owner: "www-data", :mount_options => ["dmode=777","fmode=666"]
    config.vm.synced_folder "./", "/temp"
    config.vm.network :private_network, ip: configuration["ip"]
    config.vm.network "forwarded_port", guest: 80, host: 8080

    config.vm.provider configuration["provider"] do |vb|
        vb.name = configuration["name"]
        vb.memory = configuration["ram"]
        vb.cpus = configuration["cpus"]
        vb.gui = configuration["gui"]
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
