# == Class mysql::params
#
# This class is meant to be called from mysql.
# It sets variables according to platform.
#
class nilesh_mysql_profile::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'nilesh_mysql_profile'
      $service_name = 'nilesh_mysql_profile'
    }
    'RedHat', 'Amazon': {
      $package_name = 'mysql-server'
      $service_name = 'mysql-server'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
