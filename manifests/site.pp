# <ENVIRONMENTS DIRECTORY>/<ENVIRONMENT>/manifests/site.pp
# default minimal conf 
node 'default' {
}

node 'slave1.puppet' {
  include apache
}

node 'slave2.puppet' {
  include apache
}
