# -*- mode: ruby -*-
# vi: set ft=ruby :

nodes = [
  ['node1', 10],
  ['node2', 11],
  ['node3', 12],
  ['node4', 13],
]

Vagrant.configure("2") do |config|
  config.vm.box = "boxcutter/centos71"
  nodes.each do |hostname, ip_start|
    config.vm.define "#{hostname}" do |box|
      box.vm.hostname = "#{hostname}"
      # Setting up private networking in case you want to pre-populate DNS.  These IP's are NAT'ed so you can still reach the Internet, apt-get, etc.
      box.vm.network :private_network, ip: "192.168.33.#{ip_start}", :netmask => "255.255.255.0"

      box.vm.provider :vmware_fusion do |v|
        v.vmx["memsize"] = 1024
      end
    # Run the Shell Provisioning Script file
      box.vm.provision :shell, :path => "src/base.sh"
    end
  end
end