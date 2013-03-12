# http://thedaneshproject.com/posts/how-to-install-java-7-on-ubuntu-12-04-lts/
class java::dependencies{
  if ! defined(Package['python-software-properties'])    { package { 'python-software-properties': ensure => installed } }
  if ! defined(Package['debconf-utils'])                 { package { 'debconf-utils': ensure => installed } }
}


class java::oracle{
  class{"java::dependencies":}
  -> class{"java::oracle::add_repo":}
  -> class{"java::oracle::licence_accepted":}
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

# seem to require interactive input... :(
# http://askubuntu.com/questions/190582/installing-java-automatically-with-silent-option
# http://offbytwo.com/2011/07/20/scripted-installation-java-ubuntu.html
class java::oracle::licence_accepted{
  exec{"java::oracle::licence_accepted":
    command => "echo debconf shared/accepted-oracle-license-v1-1 select true | \
      sudo debconf-set-selections && \
      echo debconf shared/accepted-oracle-license-v1-1 seen true | \
      sudo debconf-set-selections",
    unless  => "sudo debconf-get-selections|grep accepted-oracle-license-v1-1|grep true"
  }
}

class java::oracle::v7{
  class{"java::oracle":}
  #-> notify{"java7 downloading might take some time... ":}
  #-> notify{"files are stored in /var/cache/oracle-jdk7-installer, if you're bored...":}
  -> package{"oracle-java7-installer":}
}