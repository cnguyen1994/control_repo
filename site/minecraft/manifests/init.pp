class minecraft {
  include wget
  file {'/etc/environment':
    ensure => file,
    content => 'http_proxy=http://www-proxy-hqdc.us.oracle.com:80; https_proxy=http://http://www-proxy-hqdc.us.oracle.com:80; proxy=http://www-proxy-hqdc.us.oracle.com:80'
  }
  wget::retrieve { "download Minecraft server":
    source      => 'https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar',
    destination => '/opt/minecraft/server.jar',
    timeout     => 0,
    verbose     => false,
  }
  file {'/opt/minecraft':
    ensure => directory,
  }
  file {'/opt/minecraft/server.jar':
    ensure => file,
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
