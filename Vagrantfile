# -*- mode: ruby -*-
# vi: set ft=ruby :

#Vagrant::Config.run do |config|
Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.provision :shell, :path => "shell/bootstrap.sh"
  # config.vm.forward_port 4567, 4567 # dashboard
  # config.vm.forward_port 5555, 5555, { :protocol => "udp"} # riemann server
  # config.vm.forward_port 5556, 5556 # riemann server: Websocket

  config.vm.network :forwarded_port, {:guest => 4567, :host => 4567, :id => "dashboard", :auto_correct => true}
  config.vm.network :forwarded_port, {:guest => 5555, :host => 5555, :id => "riemann", :auto_correct => true, :protocol => "udp"}
  config.vm.network :forwarded_port, {:guest => 5556, :host => 5556, :id => "riemann_ws", :auto_correct => true}
  config.vm.network :forwarded_port, {:guest => 1080, :host => 1080, :id => "mailcatcher", :auto_correct => true}


  # give VM more ram
  #config.vm.customize ["modifyvm", :id, "--memory", 1024]
end
