# Class: sysctl
#
# This class configures sysctl
#
# Actions:
#   - Sets sysctl parameters (via hiera lookup)
#
# Sample Usage:
#
#    class { 'sysctl': }
#
class sysctl
  inherits ::sysctl::params {
  $sysctl_config = hiera_hash('sysctl',{})
  create_resources('sysctl::config',$sysctl_config)

}
