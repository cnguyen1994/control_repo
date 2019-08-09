class minecraft {
  file {'/opt/minecraft':
    ensure => directory,
  }
  exec {'retrieve_server':
    command => '/usr/bin/wget -q https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar -O /opt/minecraft/server.jar',
    creates => '/opt/minecraft/server.jar',
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
