class riemann{
  ## include java
  include riemann::params
  class {"riemann::dependencies":}
    -> class {'riemann::user':}
    -> class {'riemann::configs':}
    -> class {'riemann::download':}
    -> class {"riemann::service":}
}

class riemann::dependencies{
  if ! defined(Package['wget'])    { package { 'wget': ensure => installed } }
}

class riemann::user{
  user { 'riemann':
    ensure => 'present',
    uid    => $riemann::params::user_id,
  }
  -> group { "riemann":
    ensure  => "present",
    gid     => $riemann::params::user_id,
  }
}

class riemann::configs{
  file{"/etc/riemann":
    ensure => directory
  }
  -> file{"/etc/riemann/riemann.config":
    content => template("riemann/server/riemann.config.erb"),
  }
  -> file{"/etc/init/riemann.conf":
    content => template("riemann/server/upstart.conf")
  }
  -> file{"/var/log/riemann.log":
    ensure => present,
    owner  => 'riemann',
    group  => 'riemann',
    mode   => 0665,
  }
}

class riemann::download{
  exec{"download riemann":
    command => "echo 'test'  && \
                cd /opt &&  \
                rm -rf /opt/riemann && \
                wget $riemann::params::url && \
                tar xvfj $riemann::params::file  && \
                ln -s /opt/$riemann::params::folder /opt/riemann",
    unless => "test -e /opt/riemann/bin/riemann && ls -la /opt/riemann|grep $riemann::params::version"
  }
}

class riemann::service{
  service{"riemann":
    ensure    => running,
    enable    => true,
    provider  => upstart,
    subscribe => Class["riemann::configs"]
  }
}
