class riemann::params{
  $riemann_server_ip = $::ipaddress_eth0 # just for vagrant, this would be a real ip
  #$riemann_server_ip = "127.0.0.1" # just for vagrant, this would be a real ip
  $user_id           = "2222" # a rather random id...

  #http://aphyr.com/riemann/riemann-0.2.0.tar.bz2
  $version           = "0.2.0"
  $folder            = "riemann-$version"
  $file              = "$folder.tar.bz2"
  $url               = "http://aphyr.com/riemann/$file"
}