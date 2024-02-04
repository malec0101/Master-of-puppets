class minecraft_serv (
  $xmx = $minecraft_serv::minecraft_systd_service::xmx
  $xms = $minecraft_serv::minecraft_systd_service::xms
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
