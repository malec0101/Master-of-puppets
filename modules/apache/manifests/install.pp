# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::install
class apache::install {
  $package_name = $apache::params::package_name

    package { 'httpd':
      ensure => installed,
      before => File['index.html']
    }
}

