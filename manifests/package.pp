# Install a Python package for a given version of Python
#
# Usage:
#
#   python::package { 'virtualenv==1.11.2 for 3.4.2':
#     package => 'virtualenv'
#     python  => '3.4.2',
#     version => '==1.11.2',
#   }
#

define python::package($package, $python, $ensure = 'present', $version = '>= 0') {
  require python

  pyenv_package { $name:
    ensure         => $ensure,
    package        => $package,
    version        => $version,
    pyenv_version  => $python,
    pyenv_root     => $python::pyenv_root,
    provider       => pip,
  }
}
