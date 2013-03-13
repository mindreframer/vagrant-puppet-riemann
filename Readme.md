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


    # simulate all traffic
    $ riemann-simulator


![Dashboard Blinking](https://raw.github.com/mindreframer/vagrant-puppet-riemann/master/pics/dashboard_blinking.gif)



## Playing with Dashboard

    # press `?` to have the overview of available shortcuts

![Help Screenshot](https://raw.github.com/mindreframer/vagrant-puppet-riemann/master/pics/help_screenshot.png)


## Credits

  - Kyle Kingsbury - the Riemann author
  - Yukihiro Matsumoto - for Ruby
  - Rich Hickey - for Clojure
  - Linus Torvalds - for Linux
  - Mitchell Hashimoto - the Vagrant author
  - Luke Kanies - the Puppet author
  - Oracle *cough*, for keeping VirtualBox opensource
  - Oracle *cough*, for keeping Java 7 free
  - Alex Dergachev - GIF-Screencast for free on OSX: https://gist.github.com/dergachev/4627207


[Vagrant]: http://vagrantup.com
[VirtualBox]: https://www.virtualbox.org/
[Riemann]: http://riemann.io



## Resources

  [Riemann-Users Group]
    - https://groups.google.com/forum/#!forum/riemann-users

  [riemann.config documentation]
    - http://aphyr.github.com/riemann/api/riemann.config.html

  [Riemann HowTo]
    - http://riemann.io/howto.html

  [Amara metrics server - a similar Vagrant script]
    - https://github.com/pculture/amara-metrics
    - http://labs.amara.org/2012-07-16-metrics.html

  [baby steps - clojure repl and sharing your riemann.config]
    - https://groups.google.com/forum/#!topic/riemann-users/IPns8nUQiQc

  [Application specific host grouping in Riemann-dash]
    - https://gist.github.com/aaronfeng/4583640


  https://github.com/synthesist/panoptimon/wiki/Setup-example-with-riemann
