Vagrant.configure("2") do |config|

    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate//v-root", "1"]
        v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--nictype1", "Am79C973"]
    end

    config.vm.define "trusty64" do |xenial64|
        xenial64.vm.box = "ubuntu/xenial64"
        xenial64.vm.hostname = "devbox-xenial64"
        xenial64.vm.network "private_network", ip: "10.2.2.2"
        xenial64.vm.provision :shell, path: "provision.sh"
    end

end

