# -*- mode: ruby -*-
# vi: set ft=ruby :

default_box = 'vEOS-lab-4.20.1F'

Vagrant.configure(2) do |config|
  config.vm.define 'top1' do |top1|
    top1.vm.box = default_box
    #INTERFACES
    top1.vm.network 'private_network', ip: '169.254.1.11', auto_config: false
    #SSH ACCESS
    top1.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh", disabled: true
    top1.vm.network "forwarded_port", guest: 22, host: 2000
    #CONNECT INTERFACE TO SPECIFIC NETWORK SEGMENTS
    top1.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nic2", "intnet", "--intnet2", "T1-to-L1"]
      end
    top1.vm.provision "shell", path: "SHELL/top1-config.sh"
  end
  config.vm.define 'top2' do |top2|
    top2.vm.box = default_box
    top2.vm.network 'private_network', ip: '169.254.1.11', auto_config: false
    top2.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh", disabled: true
    top2.vm.network "forwarded_port", guest: 22, host: 2001
    top2.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nic2", "intnet", "--intnet2", "L2-to-T2"]
      end
    top2.vm.provision "shell", path: "SHELL/top2-config.sh"
  end

  config.vm.define 'leaf1' do |leaf1|
    leaf1.vm.box = default_box
    leaf1.vm.network 'private_network', ip: '169.254.1.11', auto_config: false
    leaf1.vm.network 'private_network', ip: '169.254.2.11', auto_config: false
    leaf1.vm.network 'private_network', ip: '169.254.3.11', auto_config: false
    leaf1.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh", disabled: true
    leaf1.vm.network "forwarded_port", guest: 22, host: 2003
    leaf1.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nic2", "intnet", "--intnet2", "T1-to-L1"]
      v.customize ["modifyvm", :id, "--nic3", "intnet", "--intnet3", "L1-to-L2"]
      v.customize ["modifyvm", :id, "--nic4", "intnet", "--intnet4", "L1-to-EDGE1"]
      end
    leaf1.vm.provision "shell", path: "SHELL/leaf1-config.sh"
  end

  config.vm.define 'leaf2' do |leaf2|
    leaf2.vm.box = default_box
    leaf2.vm.network 'private_network', ip: '169.254.1.11', auto_config: false
    leaf2.vm.network 'private_network', ip: '169.254.2.11', auto_config: false
    leaf2.vm.network 'private_network', ip: '169.254.3.11', auto_config: false
    leaf2.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh", disabled: true
    leaf2.vm.network "forwarded_port", guest: 22, host: 2004
    leaf2.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nic2", "intnet", "--intnet2", "L2-to-T2"]
      v.customize ["modifyvm", :id, "--nic3", "intnet", "--intnet3", "L1-to-L2"]
      v.customize ["modifyvm", :id, "--nic4", "intnet", "--intnet4", "L2-to-EDGE2"]
      end
    leaf2.vm.provision "shell", path: "SHELL/leaf2-config.sh"
  end

  config.vm.define 'edge1' do |edge1|
    edge1.vm.box = default_box
    edge1.vm.network 'private_network', ip: '169.254.1.11', auto_config: false
    edge1.vm.network 'private_network', ip: '169.254.2.11', auto_config: false
    edge1.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh", disabled: true
    edge1.vm.network "forwarded_port", guest: 22, host: 2005
    edge1.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nic2", "intnet", "--intnet2", "L1-to-EDGE1"]
      end
    edge1.vm.provision "shell", path: "SHELL/edge1-config.sh"
  end

  config.vm.define 'edge2' do |edge2|
    edge2.vm.box = default_box
    edge2.vm.network 'private_network', ip: '169.254.1.11', auto_config: false
    edge2.vm.network 'private_network', ip: '169.254.2.11', auto_config: false
    edge2.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh", disabled: true
    edge2.vm.network "forwarded_port", guest: 22, host: 2006
    edge2.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nic2", "intnet", "--intnet2", "L2-to-EDGE2"]
      end
    edge2.vm.provision "shell", path: "SHELL/edge2-config.sh"
  end

end
