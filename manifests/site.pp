# <ENVIRONMENTS DIRECTORY>/<ENVIRONMENT>/manifests/site.pp
# default minimal conf 
node 'default' {
}

node 'slave1.puppet' {
  include role::apache_static_site
}

node 'slave2.puppet' {
  include role::apache_dynamic_site
}
