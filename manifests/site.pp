# <ENVIRONMENTS DIRECTORY>/<ENVIRONMENT>/manifests/site.pp
# default minimal conf 
node 'default' {
  include 
}

node 'slave1.puppet' {
  include common
}

node 'slave2.puppet' {
  include 
}
