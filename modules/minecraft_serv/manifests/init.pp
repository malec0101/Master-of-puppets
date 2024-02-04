class minecraft_serv {
  include minecraft_serv::install_java
  include minecraft_serv::download_minecraft
  include minecraft_serv::minecraft_systd_service
  }
