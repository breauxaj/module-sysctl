define sysctl::config (
  $value
) {
  include ::sysctl

  $key = $title

  augeas { "sysctl_conf/${key}":
    context => $::sysctl::params::sysctl_context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    notify  => Exec['sysctl'],
  }
}