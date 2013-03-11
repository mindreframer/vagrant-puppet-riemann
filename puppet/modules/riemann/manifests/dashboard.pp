class riemann::dashboard{
  include riemann::params
  class{"riemann::dashboard::dependencies":}
    -> class{"riemann::dashboard::package":}
    -> class{"riemann::dashboard::config":}
    -> class{"riemann::dashboard::service":}
}

class riemann::dashboard::dependencies{
  if ! defined(Package['build-essential'])    { package { 'build-essential': ensure => installed } }
}

class riemann::dashboard::package{
  package{'riemann-dash': ensure => 'installed', provider => 'gem'}
}

class riemann::dashboard::config{
  file{
    ["/srv/riemann-dash", "/srv/riemann-dash/config"]:
    ensure => directory,
  }

  -> file{"/srv/riemann-dash/config.rb":
    content => template("riemann/dashboard/config.rb.erb"),
    owner => riemann, group => riemann, mode => 666
  }

  -> file{"/srv/riemann-dash/config/config.json":
    content => template("riemann/dashboard/config.json.erb"),
    owner => riemann, group => riemann, mode => 666
  }

  -> file{"/etc/init/riemann-dash.conf":
    content => template("riemann/upstart_riemann_dash.conf")
  }

  file{"/srv/riemann-dash/riemann-dash.log":
    ensure => file,
    owner => riemann, group => riemann, mode => 666
  }
}

class riemann::dashboard::service{
  service{"riemann-dash":
    ensure   => running,
    provider => upstart,
    hasstatus => true,
    subscribe => Class['riemann::dashboard::config']
  }
}