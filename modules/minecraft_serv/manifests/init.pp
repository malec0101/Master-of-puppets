class minecraft_serv (
  String $xmx = $minecraft_serv::minecraft_systd_service::xmx,
){
  class {'minecraft_serv::install_java': 
    before => Class['minecraft_serv::download_minecraft']
  }
  class {'minecraft_serv::download_minecraft' 
    require => Class['minecraft_serv::install_java']
    before  => Class['minecraft_serv::minecraft_systd_service']
  }
  class {'minecraft_serv::minecraft_systd_service'
    require => Class['minecraft_serv::download_minecraft']
  }
  }
