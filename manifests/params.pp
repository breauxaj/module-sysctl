# Class: sysctl::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class sysctl::params {
  case $::operatingsystem {
    'Amazon': {
      $sysctl_config  = '/etc/sysctl.conf'
      $sysctl_context = "/files/${sysctl_config}"

      file { $sysctl_config:
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
      }

      exec { '/sbin/sysctl -e -p':
        alias       => 'sysctl',
        refreshonly => true,
        subscribe   => File[$sysctl_config],
      }
    }
    'CentOS', 'OracleLinux', 'RedHat': {
      case $::operatingsystemmajrelease {
        '6': {
          $sysctl_config  = '/etc/sysctl.conf'
          $sysctl_context = "/files/${sysctl_config}"

          file { $sysctl_config:
            ensure => present,
            owner  => 'root',
            group  => 'root',
            mode   => '0644',
          }

          exec { '/sbin/sysctl -e -p':
            alias       => 'sysctl',
            refreshonly => true,
            subscribe   => File[$sysctl_config],
          }
        }
        '7': {
          $sysctl_config  = '/etc/sysctl.d/50-puppet.conf'
          $sysctl_context = "/files/${sysctl_config}"

          file { $sysctl_config:
            ensure => present,
            owner  => 'root',
            group  => 'root',
            mode   => '0644',
          }

          exec { '/sbin/sysctl --system':
            alias       => 'sysctl',
            refreshonly => true,
            subscribe   => File[$sysctl_config],
          }
        }
        default: {
          fail("The ${module_name} module is not supported on an ${::operatingsystem} ${::operatingsystemmajrelease} distribution.")
        }
      }
    }
    'Debian': {
      case $::operatingsystemmajrelease {
        '8': {
          $sysctl_config  = '/etc/sysctl.d/50-puppet.conf'
          $sysctl_context = "/files/${sysctl_config}"

          file { $sysctl_config:
            ensure => present,
            owner  => 'root',
            group  => 'root',
            mode   => '0644',
          }

          exec { '/sbin/sysctl --system':
            alias       => 'sysctl',
            refreshonly => true,
            subscribe   => File[$sysctl_config],
          }
        }
        default: {
          fail("The ${module_name} module is not supported on an ${::operatingsystem} ${::operatingsystemmajrelease} distribution.")
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::operatingsystem} based system.")
    }
  }
}