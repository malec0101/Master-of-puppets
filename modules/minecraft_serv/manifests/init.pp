class minecraft_serv (
  $xmx = minecraft_serv::minecraf_systd_servise::xmx 
  $xms = minecraft_serv::minecraf_systd_servise::xms
) {
  package { 'java-17-openjdk':
      ensure => installed,
    }
    file { '/opt/minecraft':
      ensure  => directory,
      owner   => 'root',
      group   => 'root',
    }
    file { '/opt/minecraft/eula.txt':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      content => file('minecraft_serv/eula.txt'),
      require => File['/opt/minecraft']
    }
    file { '/opt/minecraft/server.jar':
      ensure => file,
      source => 'https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar',
      require => Package['java-17-openjdk']
    }
    include minecraft_serv::minecraf_systd_servise
  }
