node default{
  class{"java::oracle::v7":}
  -> class{"riemann":}
}