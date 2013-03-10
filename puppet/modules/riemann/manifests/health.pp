class riemann::health{
  include riemann::riemann_tools
  if $::operatingsystem == "Ubuntu" {
    case $lsbmajdistrelease {
      8:{
        include riemann::health::initd
      }
      default:{
        include riemann::health::upstart
      }
    }
  }
}

class riemann::health::upstart{
  include riemann::health::upstart_config
  class{"riemann::health::upstart_service":
    require => [Class['riemann::riemann_tools'], Class['riemann::health::upstart_config']]
  }
}

class riemann::health::initd{
  include riemann::health::initd_config
  class{"riemann::health::initd_service":
    require => [Class['riemann::riemann_tools'], Class['riemann::health::initd_config']]
  }
}


## the actual configs
class riemann::health::upstart_config{
  include riemann::params
  file{"/etc/init/riemann-health.conf":
    content => template("riemann/upstart_riemann_health.conf")
  }
}

class riemann::health::upstart_service{
  service{"riemann-health":
    ensure   => running,
    provider => upstart,
    hasstatus => true,
    subscribe => Class['riemann::health::upstart_config']
  }
}

class riemann::health::initd_config{
  include riemann::params
  file{"/etc/init.d/riemann-health":
    content => template("riemann/initd_riemann_health.erb"),
    mode => 755
  }
}

class riemann::health::initd_service{
  service{"riemann-health":
    ensure   => running,
    subscribe => Class['riemann::health::initd_config']
  }
}