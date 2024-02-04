class minecraft_serv (
  String $xmx = $minecraft_serv::minecraft_systd_service::xmx,
  String $xms = $minecraft_serv::minecraft_systd_service::xms,
) {
  Class['minecraft_serv::install_java'] -> Class['minecraft_serv::download_minecraft'] -> Class['minecraft_serv::minecraft_systd_service']
}
