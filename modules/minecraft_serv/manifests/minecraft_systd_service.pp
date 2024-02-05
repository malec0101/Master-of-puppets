class minecraft_serv::minecraft_systd_service {
  $xmx = '1200m'
  $xms = '512m'
  -> file { '/etc/systemd/system/minecraft.service':
    ensure  => file,
    content => epp('minecraft_serv/minecraft.service.epp'),
    before  => Service['minecraft']
  }
  ~> service { 'minecraft':
    ensure => running,
    enable => true,
  }
}
