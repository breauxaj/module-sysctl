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
class sysctl {
  $sysctl_config = hiera('sysctl',{})
  create_resources('sysctl::config',$sysctl_config)
}