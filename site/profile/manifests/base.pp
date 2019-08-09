class profile::base {
  include profile::ssh_server
  include vcsrepo
  user {'admin':
    ensure => present,
  }
}
