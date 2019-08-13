class minecraft {
  file {'/opt/minecraft':
    ensure => directory,
  }
  exec { 'Set Proxy': 
    command => 'echo "export http_proxy=http://www-proxy-hqdc.us.oracle.com:80 && export https_proxy=http://www-proxy-hqdc.us.oracle.com:80 && export proxy=http://www-proxy-hqdc.us.oracle.com:80" >> ~/.bashrc && source ~/.bashrc && curl https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar -o /opt/minecraft/server.jar', 
    path    => ['/usr/bin', '/usr/sbin',],
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
