class minecraft_serv::download_minecraft {
  file { '/opt/minecraft':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    before => File['/opt/minecraft/eula.txt']
  }
  file { '/opt/minecraft/server.jar':
    ensure  => file,
    source  => 'https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar',
    require => File['/opt/minecraft/eula.txt']
  }
}
