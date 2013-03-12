class riemann::simulators{
  file{"/usr/local/bin/riemann-web-traffic.rb":
    content => template("riemann/simulators/webclients.rb.erb"),
    mode    => 0755
  }
}
