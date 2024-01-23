class minecraft_serv::minecraft_systd_servise {
  #$xmx = '1024m'
  #$xms = '512m'
  file { '/etc/systemd/system/minecraft.service':
    ensure    => file,
    owner     => 'root',
    group     => 'root',
    mode      => '0664',
    content   => file('minecraft_serv/minecraft.servise')
    # content => epp('minecraft_serv/minecraf.servise.epp', {'xmx' => '1024m', 'xms' => '512m' }),
    require   => File['/opt/minecraft/server.jar'],
  }
  service { 'minecraf':
    ensure   => restarted
    require  => File['/etc/systemd/system/minecraft.service'], 
  }
}
