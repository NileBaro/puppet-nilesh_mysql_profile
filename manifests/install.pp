# == Class mysql::install
#
# This class is called from mysql for install.
#
class nilesh_mysql_profile::install {

  package { $::nilesh_mysql_profile::package_name:
    ensure => present,
  }
}
