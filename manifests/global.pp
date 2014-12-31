# Specify the global Python version
#
# Usage:
#
#   class { 'python::global': version => '3.4.2' }
#

class python::global($version = '3.4.2') {
  include python

  if $version != 'system' {
    ensure_resource('python::version', $version)
    $require = Python::Version[$version]
  } else {
    $require = undef
  }

  file { "${python::pyenv_root}/version":
    ensure  => present,
    owner   => $python::user,
    mode    => '0644',
    content => "${version}\n",
    require => $require,
  }
}
