class minecraft_serv (
  String $xmx = $minecraft_serv::minecraft_systd_service::xmx,
  String $xms = $minecraft_serv::minecraft_systd_service::xms,
) {
  include minecraft_serv::install_java
  include minecraft_serv::download_minecraft
  include minecraft_serv::minecraft_systd_service
}
