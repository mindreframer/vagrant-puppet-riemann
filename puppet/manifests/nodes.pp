node default{
  class{"java::oracle::v7": stage => first}
  -> class{"riemann":}
  -> class{"riemann::health":}
  -> class{"riemann::dashboard":}
  -> class{"riemann::simulators":}
  -> class{"mailcatcher":}
  -> class{"leiningen":}
}