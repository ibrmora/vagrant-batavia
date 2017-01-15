# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "batavia"
  config.vm.box_check_update = true

  config.vm.network "forwarded_port", guest: 8000, host: 8100

  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.synced_folder "pybee/", "/pybee",
    ssh_opts_append: "-o IdentitiesOnly=yes ",
    #sshfs_opts_append: "-o nonempty ",
    disabled: false, type: "sshfs", create: true

  config.vm.provider "virtualbox" do |v|
    v.name = "batavia"
  end

  config.vm.provision "development-environment", path: "provision-batavia.sh",
    privileged: false, type: "shell"
  config.vm.provision "testserver", path: "provision-batavia-testserver.sh",
    privileged: false, type: "shell"


end
