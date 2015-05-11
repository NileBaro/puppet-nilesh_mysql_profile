# == Class: mysql
#
# Full description of class mysql here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.

class nilesh_mysql_profile (

  $package_name = $::nilesh_mysql_profile::params::package_name,
  $service_name = $::nilesh_mysql_profile::params::service_name,

) inherits ::nilesh_mysql_profile::params {

#  Class['nilesh_mysql_profile::install'] -> 
#  Class['nilesh_mysql_profile::config'] -> 
#  Class['nilesh_mysql_profile::service']

  include nilesh_mysql_profile::params 
  $mysql_user = hiera('mysql_user')
  $mysql_database = hiera('mysql_database')
  create_resources(mysql_user, $mysql_user)
  create_resources(mysql_database, $mysql_database)

  # Add hiera() lookups here, with validation

}
