# == Class mysql::service
#
# This class is meant to be called from mysql.
# It ensure the service is running.
#
class nilesh_mysql_profile::service {

  service { $::nilesh_mysql_profile::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
