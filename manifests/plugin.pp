# Define: python::plugin
# Parameters:
# $ensure, $source
#
# Usage:
#
#   python::plugin { 'pyenv-version':
#     ensure => 'v20141211',
#     source => 'yyuu/pyenv-virtualenv'
#   }
#

define python::plugin ($ensure, $source) {
  include python

  repository { "${python::pyenv_root}/plugins/${name}":
    ensure  => $ensure,
    force   => true,
    source  => $source,
    user    => $python::user,
    require => Repository[$python::pyenv_root],
  }
}
