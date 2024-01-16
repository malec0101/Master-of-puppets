# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache
class apache (
  $package_name =  $apache::params::package_name,
  $service_name =  $apache::params::service_name,
  $config_file  =  $apache::params::config_file,
  $virtual_host_name = $apache::params::virtual_host_name,
  $virtual_host_conf = $apache::params::virtual_host_conf,
)
  {
    include apache::install
    include apache::config

    service { $service_name:
      ensure => running,
      enable => true,
      subscribe => File[$config_file],
    }
  }
