class minecraft_serv::install_java {
  package { 'java-17-openjdk':
      ensure => installed,
    }
