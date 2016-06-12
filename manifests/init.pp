# Class: sysctl
#
# This class configures sysctl
#
# Parameters:
#
#  value:
#    Assigns value to key/title
#
# Actions:
#   - Sets sysctl parameters
#
# Sample Usage:
#
#    sysctl {
#      'kernel.exec-shield': value => 1;
#    }
#
class sysctl (
  $value
) inherits ::sysctl::params {
  $key = $title

  augeas { "sysctl_conf/${key}":
    context => $::sysctl::params::sysctl_context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    notify  => Exec['sysctl'],
  }
}