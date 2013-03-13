class leiningen{
  class{"leiningen::config":}
}

class leiningen::config{
  file{"/usr/local/bin/lein":
    content => template("leiningen/lein.erb"),
    mode    => 0755
  }
}