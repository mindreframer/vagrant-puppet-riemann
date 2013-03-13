node default{
  class{"java::oracle::v7":}
  -> class{"riemann":}
  -> class{"riemann::health":}
  -> class{"riemann::dashboard":}
  -> class{"riemann::simulators":}
  -> class{"leiningen":}
}