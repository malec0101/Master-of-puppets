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
###############################################

# default minimal conf 
node 'default' {
  include profile::install_my_default_pkg
  firewall { '099 allow puppetserver access':
    dport  => 8140,
    proto  => 'tcp',
    jump   => 'accept',
  }
  firewall { '100 allow ssh access':
    dport  => 22,
    proto  => 'tcp',
    jump   => 'accept',
  }
}

node 'slave1.puppet' {
  include role::apache_static_site
  firewall { '101 allow httpd access':
    dport  => 80,
    proto  => 'tcp',
    jump   => 'accept',
  }
}

node 'slave2.puppet' {
  include role::apache_dynamic_site
  firewall { '101 allow httpd access':
    dport  => 80,
    proto  => 'tcp',
    jump   => 'accept',
  }
}
