class riemann::absent{
  file{"/etc/init/riemann-health.conf": ensure => absent}
  exec{"ensure-unrunning":
    command => "pkill -9 -f riemann-health",
    onlyif  => "ps -ef|grep -v grep|grep riemann-health"
  }
}