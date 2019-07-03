# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version '>= 1.8.0'

Vagrant.configure(2) do |config|
    #config.vm.box = 'bento/ubuntu-18.04'
    config.vm.box = 'ubuntu/bionic64'
    
    config.vm.provider 'virtualbox' do |v|
        vb.cpus = 4
        vb.memory = '8192'
        vbox.gui = true
        vbox.linked_clone = true
        vbox.customize ['modifyvm', :id, '--bioslogodisplaytime', '0']
        vbox.customize ['modifyvm', :id, '--biosbootmenu', 'disabled']
        vbox.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
        vbox.customize ['modifyvm', :id, '--draganddrop', 'disabled']
        vbox.customize ['modifyvm', :id, '--mouse', 'usbtablet']
        vbox.customize ['modifyvm', :id, '--keyboard', 'usb']
        vbox.customize ['modifyvm', :id, '--nictype1', 'virtio']
        vbox.customize ['modifyvm', :id, '--paravirtprovider', 'kvm']
        vbox.customize ['modifyvm', :id, '--vram', '256']
    end
  
    ## cf. https://www.vagrantup.com/docs/provisioning/
    config.vm.provision :shell, path: 'scripts/git.sh'
    config.vm.provision :shell, path: 'scripts/docker-ce.sh'
    config.vm.provision :shell, path: 'scripts/docker-compose.sh'
  end