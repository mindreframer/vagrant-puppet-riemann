# http://thedaneshproject.com/posts/how-to-install-java-7-on-ubuntu-12-04-lts/
class java::dependencies{
  if ! defined(Package['python-software-properties'])    { package { 'python-software-properties': ensure => installed } }
}


class java::oracle{
  class{"java::dependencies":}
  -> class{"java::oracle::add_repo":}
}

class java::oracle::add_repo{
  exec{"java::oracle::add_repo":
    command => "add-apt-repository -y ppa:webupd8team/java",
    unless  => "test -e /etc/apt/sources.list.d/webupd8team-java-precise.list"
  }

  exec{"java::oracle::apt-get-update":
    command => "apt-get update && touch /var/tmp/.java_oracle_apt-get-update",
    unless  => "test -e /var/tmp/.java_oracle_apt-get-update"
  }
}

class java::oracle::v7{
  class{"java::oracle":}
  -> package{"oracle-java7-installer":} # seem to require interactive input... :(
}