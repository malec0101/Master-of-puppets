class minecraft_serv::minecraft_systd_service {
  $xmx = '1024m'
  $xms = '512m'
  file { '/etc/systemd/system/minecraft.service':
    ensure  => file,
    #content   => file('minecraft_serv/minecraft.servise'),
    content => epp('minecraft_serv/minecraft.service.epp'),
    before  => Service['minecraft'],
  }
  service { 'minecraft':
    ensure  => restarted
  }
}
