# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "base"
  config.vm.provision :shell, :path => "shell/bootstrap.sh"
  config.vm.forward_port 4567, 4567 # dashboard
  config.vm.forward_port 5555, 5555 # riemann server
end
