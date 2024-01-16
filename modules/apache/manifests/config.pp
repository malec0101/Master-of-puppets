# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::config
class apache::config {
  $virtual_host_name = $apache::params::virtual_host_name
  $virtual_host_conf = $apache::params::virtual_host_conf
  $document_root     = $apache::params::document_root
  file { $document_root:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0644'

  }


  }
