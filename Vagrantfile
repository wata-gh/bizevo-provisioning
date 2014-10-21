# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'bizevo/centos7_64'
  config.vm.box_url = 'https://f0fff3908f081cb6461b407be80daf97f07ac418.googledrive.com/host/0BwtuV7VyVTSkUG1PM3pCeDJ4dVE/centos7.box'

  if ENV["PROCESSOR_ARCHITECTURE"] == 'x86'
    puts "falling back to 32-bit guest architecture :("
    config.vm.box = 'bizevo/centos6.4_i386'
    config.vm.box_url = 'http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-i386-v20131103.box'
  end
  config.vm.network "private_network", ip: "192.168.33.30"
end
