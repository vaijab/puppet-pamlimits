# == Class: pamlimits
#
# This class allows to manage <code>/etc/security/limits.conf</code> file.
#
# === Parameters
#
# [*conf*]
#   Reads a supplied hash and compiles <code>limits.conf</code> file. See
#   examples for more details.
#
# === Requires
#
# None
#
# === Examples
#
#     ---
#     classes:
#       - 'pamlimits'
#
#     pamlimits::conf:
#       '*/soft/nofile':
#         value: 1024
#       'joe/-/nofile':
#         value: 128
#
# === Authors
#
# - Vaidas Jablonskis <jablonskis@gmail.com>
#
class pamlimits(
  $configuration = hiera_hash('pamlimits::conf', undef),
  ) {
  case $::operatingsystem {
    CentOS, RedHat, Debian, Ubuntu: {
      $config_file  = '/etc/security/limits.conf'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }

  $config_template = 'limits.conf.erb'

  file { $config_file:
    ensure  => file,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template("${module_name}/${config_template}"),
  }
}
