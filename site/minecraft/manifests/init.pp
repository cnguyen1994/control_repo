class minecraft (
  $url = 'https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar',
  $proxy_url = 'http://www-proxy-hqdc.us.oracle.com:80',
  $install_dir = '/opt/minecraft',
){
  file {$install_dir:
    ensure => directory,
  }
  exec { 'Set Proxy': 
    command => 'echo "export http_proxy=${proxy_url} && export https_proxy=${proxy_url} && export proxy=${proxy_url}" >> ~/.bashrc && source ~/.bashrc && curl ${url} -o ${install_dir}/server.jar', 
    path    => ['/usr/bin', '/usr/sbin',],
   }
  file {"${install_dir}/server.jar":
    ensure => file,
    before => Service['minecraft'],
  }
  package {'java':
    ensure => present,
  }
  file {"${install_dir}/eula.txt":
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    content => epp('minecraft/minecraft.service', {
      install_dir => $install_dir,
    })
  }
  service { 'minecraft':
    ensure => running,
    enable => true,
    required => [Package['java'],File['${install_dir}/eula.txt'],File['/etc/systemd/system/minecraft.service']],
  }
}
