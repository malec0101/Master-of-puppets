class my_fw::post {
  firewall { '999 drop all':
    proto  => 'all',
    jump   => 'accept',
    before => undef,
  }
}