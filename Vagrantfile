# -*- mode: ruby -*-
# vi: set ft=ruby :

# vagrant plugin install vagrant-disksize vagrant-vbguest

$set_environment_variables = <<SCRIPT
tee "/etc/profile.d/myvars.sh" > "/dev/null" <<EOF
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
EOF
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 6144
    vb.cpus = 4
    vb.default_nic_type = "82543GC"
  end
  config.vm.box = "ubuntu/bionic64"
  config.disksize.size = '150GB'
  config.vm.provision :shell, inline: $set_environment_variables, run: "always"
  config.vm.provision :shell, path: "script/create_swap.sh", run: "always"
  config.vm.provision :shell, path: "script/bootstrap.sh"
end
