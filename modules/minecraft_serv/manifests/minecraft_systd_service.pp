class minecraft_serv::minecraf_systd_servise {
  $xmx = '1024m',
  $xms = '512m',
  file { '/etc/systemd/system/minecraft.service':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0664',
    content => epp('minecraft_serv/minecraf.servise.epp', {'Xmx' => '$xmx', 'Xms' => '$xms' }),
    require => File['/opt/minecraft/server.jar'],
  }
  service { 'minecraf':
    restart  => true,
    require  => File['/etc/systemd/system/minecraft.service'], 
  }
}