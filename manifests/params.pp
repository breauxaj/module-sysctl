# Class: sysctl::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class sysctl::params {
  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        default: {
          case $::operatingsystemmajrelease {
            default: {
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
          }
        }
      }
    }
    'RedHat': {
      case $::operatingsystem {
        'Amazon': {
          case $::operatingsystemmajrelease {
            default: {
              $sysctl_config  = '/etc/sysctl.d/50-puppet.conf'
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
          }
        }
        default: {
          case $::operatingsystemmajrelease {
            default: {
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
          }
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}
