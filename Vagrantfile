# -*- mode: ruby -*-
# vi: set ft=ruby :

# Initial support of refactor for CentOS7

playbook = "mesos.yml"
boxname = "centos/7"
memmb = "1024"
numcpu = "1"

boxes = [
    {
        :name => "master1",
        :eth1 => "10.142.142.11",
    },
    {
        :name => "master2",
        :eth1 => "10.142.142.12",
    },
    {
        :name => "master3",
        :eth1 => "10.142.142.13",
    },
    {
        :name => "agent1",
        :eth1 => "10.142.142.21",
    },
    {
        :name => "agent2",
        :eth1 => "10.142.142.22",
    },
    {
        :name => "agent3",
        :eth1 => "10.142.142.23",
    }
]

Vagrant.configure(2) do |config|

  boxes.each_with_index do |box, index|
    config.vm.define box[:name] do |config|

      config.vm.box = boxname

      config.ssh.insert_key = false
      config.vm.hostname = box[:name]

      config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", memmb]
        v.customize ["modifyvm", :id, "--cpus", numcpu]
      end

      config.vm.network :private_network, ip: box[:eth1]

      config.vm.provision "shell", path: "vagrant_bootstrap.sh"

      if index == boxes.size - 1
        config.vm.provision "ansible" do |ansible|
            #ansible.verbose = "vv"
            ansible.playbook = playbook
            ansible.limit = "all"
            ansible.inventory_path = "inventories/vagrant/hosts"
            ansible.host_key_checking = false
            ansible.raw_ssh_args = ['-i ~/.vagrant.d/insecure_private_key']
	          ansible.raw_arguments = ['--forks=5']
            ansible.extra_vars = {
              environment_name: "vagrant"
            }
        end
      end
    end
  end
end
