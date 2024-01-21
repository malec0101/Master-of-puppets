class my_fw::post {
  firewall { '100 open default ssh port 22':
    dport  => 22,
    proto  => 'tcp',
    jump  => 'accept',
  }
  firewall { '999 drop all':
    proto  => 'all',
    jump   => 'drop',
    before => undef,
  }
}
