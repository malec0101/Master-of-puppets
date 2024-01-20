# <ENVIRONMENTS DIRECTORY>/<ENVIRONMENT>/manifests/site.pp

############## Firewall #######################
resources { 'firewall':
    purge => true,
  }
Firewall {
    before  => Class['my_fw::post'],
    require => Class['my_fw::pre'],
  }

  class { ['my_fw::pre', 'my_fw::post']: }

# rules fw on slave.puppet 
node /^slave\d+$\.puppet$/ {
  firewall { '100 open port 22':
    dport  => 22,
    proto  => 'tcp',
  }
}
###############################################

node 'slave1.puppet' {
  include role::apache_static_site
  firewall { '101 open port 80':
    dport  => 80,
    proto  => 'tcp',
  }
}

node 'slave2.puppet' {
  include role::apache_dynamic_site
  firewall { '101 open port 80':
    dport  => 80,
    proto  => 'tcp',
  }
}
