class minecraft {
  include vcsrepo
  file {'/opt/minecraft':
    ensure => directory,
  }
  vcsrepo { '/opt/minecraft/server.jar':
    ensure   => present,
    provider => wget,
    source   => 'https://github.com/technomancy/leiningen.git',
    revision => 'stable',
  }
  file {'/opt/minecraft/server.jar':
    ensure => file,
    mode   => '0755',
    source => Exec["retrieve_server"],
  }
  package {'java':
    ensure => present,
  }
  file {'/opt/minecraft/eula.txt':
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
  service { 'minecraft':
    ensure => running,
    enable => true,
  }
}
