# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::params
class apache::params {
  $virtual_host_name = 'example'
  case $facts['os']['family'] {
    'RedHat': {
      $package_name = 'httpd'
      $service_name = 'httpd'
      $config_file  = '/etc/httpd/conf/httpd.conf'
      $virtual_host_conf = "/etc/httpd/conf.d/${virtual_host_name}.conf"
      $document_root = "/var/www/html/${virtual_host_name}"
    }
    'Debian': {
      $package_name = 'apache2'
      $service_name = 'apache2'
    }
    default: { fail }
  }
}
