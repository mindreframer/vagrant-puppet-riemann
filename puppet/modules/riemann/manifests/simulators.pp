class riemann::simulators{
  file{"/usr/local/bin/riemann-simulator":
    content => template("riemann/simulators/riemann-simulator.erb"),
    mode    => 0755
  }
}
