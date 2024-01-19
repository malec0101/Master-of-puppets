class profile::install_my_default_pkg {
  package { ['ranger', 'tmux']:
    ensure => 'installed',
  }
}
