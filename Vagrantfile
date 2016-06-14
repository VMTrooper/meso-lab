# -*- mode: ruby -*-
# vi: set ft=ruby :

ANSIBLE_GROUPS = {
              "master" => ["node1"],
              "nodes" => ["node2", "node3", "node4"],
              "all_groups:children" => ["master", "nodes"]
            }

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
      # box.vm.hostname = "#{hostname}"
      # Setting up private networking in case you want to pre-populate DNS.  These IP's are NAT'ed so you can still reach the Internet, apt-get, etc.
      box.vm.network :private_network, ip: "192.168.33.#{ip_start}", :netmask => "255.255.255.0"

      # If using VMware Fusion
      box.vm.provider :vmware_fusion do |v|
        if hostname=="node1"
          v.vmx["memsize"] = 2048
        else
          v.vmx["memsize"] = 1024
        end
      end
      # If using VirtualBox
      box.vm.provider :virtualbox do |vbox|
      # Defaults
        vbox.customize ["modifyvm", :id, "--memory", 1024]
        vbox.customize ["modifyvm", :id, "--cpus", 1]
        if hostname == "node1"
          vbox.customize ["modifyvm", :id, "--memory", 2048]
          vbox.customize ["modifyvm", :id, "--cpus", 2]
        end
      end
    # Run the Shell Provisioning Scripts
    # Getting around Vagrant's "feature" to continually set hostname to resolve to 127.0.0.1
      box.vm.provision :shell, inline: "sudo sysctl kernel.hostname=#{hostname}"
      # box.vm.provision :shell, :path => "src/base.sh"
      box.vm.provision "ansible" do |ansible|
          ansible.playbook = "src/playbook.yml"
          ansible.groups = ANSIBLE_GROUPS
      end
    end
  end
end