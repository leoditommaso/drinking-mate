# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define 'dns' do |dns|
    dns.ohai.primary_nic = "eth1"
    dns.vm.hostname = "cdn-dns"
    dns.omnibus.chef_version = :latest
    dns.vm.box = "chef/ubuntu-12.04"
    dns.vm.network :private_network, ip: "190.205.40.8"
    dns.berkshelf.enabled = true
    dns.vm.provider "virtualbox" do |vb| 
      vb.customize ["modifyvm", :id, "--memory", "384"]
    end
    dns.vm.provision :chef_solo do |chef|
      chef.json = {
      }
      chef.run_list = [
        'recipe[apt::default]',
        'recipe[lab-cdn::dns]'
      ]
    end
  end

  config.vm.define 'www', primary: true do |www|
    www.ohai.primary_nic = "eth1"
    www.vm.hostname = "cdn-www"
    www.omnibus.chef_version = :latest
    www.vm.box = "chef/ubuntu-12.04"
    www.vm.network :private_network, ip: "190.205.40.3"
    www.berkshelf.enabled = true
    www.vm.provider "virtualbox" do |vb| 
      vb.customize ["modifyvm", :id, "--memory", "384"]
    end
    www.vm.provision :chef_solo do |chef|
      chef.json = {
      }
      chef.run_list = [
        'recipe[apt::default]',
        'recipe[lab-cdn::resolver]',
        'recipe[lab-cdn::webserver]'
      ]
    end
  end

  config.vm.define 'africa' do |africa|
    africa.ohai.primary_nic = "eth1"
    africa.vm.hostname = "cdn-africa"
    africa.omnibus.chef_version = :latest
    africa.vm.box = "chef/ubuntu-12.04"
    africa.vm.network :private_network, ip: "222.12.25.22"
    africa.berkshelf.enabled = true
    africa.vm.provider "virtualbox" do |vb| 
      vb.customize ["modifyvm", :id, "--memory", "384"]
    end
    africa.vm.provision :chef_solo do |chef|
      chef.json = {
      }
      chef.run_list = [
        'recipe[apt::default]',
        'recipe[lab-cdn::resolver]',
        'recipe[lab-cdn::cdn]'
      ]
    end
  end

  config.vm.define 'america' do |america|
    america.ohai.primary_nic = "eth1"
    america.vm.hostname = "cdn-america"
    america.omnibus.chef_version = :latest
    america.vm.box = "chef/ubuntu-12.04"
    america.vm.network :private_network, ip: "189.32.120.14"
    america.berkshelf.enabled = true
    america.vm.provider "virtualbox" do |vb| 
      vb.customize ["modifyvm", :id, "--memory", "384"]
    end
    america.vm.provision :chef_solo do |chef|
      chef.json = {
      }
      chef.run_list = [
        'recipe[apt::default]',
        'recipe[lab-cdn::resolver]',
        'recipe[lab-cdn::cdn]'
      ]
    end
  end

  config.vm.define 'asia' do |asia|
    asia.ohai.primary_nic = "eth1"
    asia.vm.hostname = "cdn-asia"
    asia.omnibus.chef_version = :latest
    asia.vm.box = "chef/ubuntu-12.04"
    asia.vm.network :private_network, ip: "154.23.129.10"
    asia.berkshelf.enabled = true
    asia.vm.provider "virtualbox" do |vb| 
      vb.customize ["modifyvm", :id, "--memory", "384"]
    end
    asia.vm.provision :chef_solo do |chef|
      chef.json = {
      }
      chef.run_list = [
        'recipe[apt::default]',
        'recipe[lab-cdn::resolver]',
        'recipe[lab-cdn::cdn]'
      ]
    end
  end

  config.vm.define 'europa' do |europa|
    europa.ohai.primary_nic = "eth1"
    europa.vm.hostname = "cdn-europa"
    europa.omnibus.chef_version = :latest
    europa.vm.box = "chef/ubuntu-12.04"
    europa.vm.network :private_network, ip: "105.4.12.3"
    europa.berkshelf.enabled = true
    europa.vm.provider "virtualbox" do |vb| 
      vb.customize ["modifyvm", :id, "--memory", "384"]
    end
    europa.vm.provision :chef_solo do |chef|
      chef.json = {
      }
      chef.run_list = [
        'recipe[apt::default]',
        'recipe[lab-cdn::resolver]',
        'recipe[lab-cdn::cdn]'
      ]
    end
  end

  config.vm.define 'argentina' do |argentina|
    argentina.ohai.primary_nic = "eth1"
    argentina.vm.hostname = "cdn-argentina"
    argentina.omnibus.chef_version = :latest
    argentina.vm.box = "chef/ubuntu-12.04"
    argentina.vm.network :private_network, ip: "190.205.40.10"
    argentina.berkshelf.enabled = true
    argentina.vm.provider "virtualbox" do |vb| 
      vb.gui = true
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
    argentina.vm.provision :chef_solo do |chef|
      chef.json = {
      }
      chef.run_list = [
        'recipe[apt::default]',
        'recipe[lab-cdn::resolver]',
        'recipe[lab-cdn::desktop]'
      ]
    end
  end

  config.vm.define 'egipto' do |egipto|
    egipto.ohai.primary_nic = "eth1"
    egipto.vm.hostname = "cdn-egipto"
    egipto.omnibus.chef_version = :latest
    egipto.vm.box = "chef/ubuntu-12.04"
    egipto.vm.network :private_network, ip: "190.205.40.11"
    egipto.berkshelf.enabled = true
    egipto.vm.provider "virtualbox" do |vb| 
      vb.gui = true
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
    egipto.vm.provision :chef_solo do |chef|
      chef.json = {
      }
      chef.run_list = [
        'recipe[apt::default]',
        'recipe[lab-cdn::resolver]',
        'recipe[lab-cdn::desktop]'
      ]
    end
  end

end
