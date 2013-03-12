# Sandbox with traffic simulator to play with [Riemann] in [VirtualBox] with [Vagrant]



![Dashboard Screenshot](https://raw.github.com/mindreframer/vagrant-puppet-riemann/master/pics/dashboard_screenshot.png)


### This will install and configure for you:

  - Java 7 (Oracle)
  - Riemann server with basic configuration
  - Riemann Dashboard with some pre-configured graphs
  - Riemann Tools
  - Riemann Health Daemon, that will send every 10 seconds cpu/memory/load/disk status to Riemann server
  - Ports 5555 (riemann-server), 5556(UDP for riemann) and 4567 (dashboard) will be forwarded



## Requirements
  - [VirtualBox]
  - [Vagrant]


## Installation

    $ git clone git://github.com/mindreframer/vagrant-puppet-riemann.git
    $ cd vagrant-puppet-riemann

    # start vagrant
    # java installation could take a while, it is bigger than 100MB
    $ vagrant up

    # ssh into your VM
    $ vagrant ssh


## Run Puppet, after you have changed modules

    $ runpuppet

## Generate some events for Riemann (a rather naive approach, but you'll have some data to play with)
    # open localhost:4567 in your browser

    # simulate health checks reports
    $ riemann-simulator -s health

    # simulate traffic
    $ riemann-simulator -s web


## Playing with Dashboard

    # press `?` to have the overview of available shortcuts

![Dashboard Screenshot](https://raw.github.com/mindreframer/vagrant-puppet-riemann/master/pics/help_screenshot.png)



[Vagrant]: http://vagrantup.com
[VirtualBox]: https://www.virtualbox.org/
[Riemann]: http://riemann.io