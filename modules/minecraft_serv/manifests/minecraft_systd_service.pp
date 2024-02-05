class minecraft_serv::minecraft_systd_service {
  $xmx = '1200m'
  $xms = '512m'
  -> file { '/etc/systemd/system/minecraft.service':
    ensure  => file,
    #content   => file('minecraft_serv/minecraft.servise'),
    content => epp('minecraft_serv/minecraft.service.epp'),
  }
  -> service { 'minecraft':
    ensure => running,
    enable => true,
  }
  -> service { 'minecraft':
    ensure => stopped,
  }
  -> file { '/opt/minecraft/eula.txt':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    content => file('minecraft_serv/eula.txt'),
  }
  -> service { 'minecraft':
    ensure => running,
  } 
}
