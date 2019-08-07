class profile::ssh_server {
  package {'openssh-server':
    ensure => present,
  }
  service {'sshd':
    ensure => 'running',
    enable => 'true',
  }
  ssh_authorized_key {'root@master.puppet.vm':
    ensure => 'present',
    user   => 'root',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDCRTPliaUHJXh/WdxDk5DmLpfQIwOagflxtpHpGQMtSogWJTWMZS1/kfjiYPj57aO0MxSflxFU+IjrLzz0B4qosc+PjgY56Tp4NvtC9DVA9Sb/hSQ9uI+dV9A3MXFfgjorvS3yOT1ezprzPuW2vKkhNyCjo7l6ckeJ/nzWwygnEjlEUC8Sn/+i7/kQ8kIRNIDuadGjzwP7wJomkzCv18qBZxoiSkcObEDLTx/6HdxGIWH592DQFboM6G8RU+ZPWF4XDNRGpNKzbD//k8y/ZQsTIV8Oi0OoUodkY8nWm2UB6FDqSOvs7mUAHJDdHtmCwDNDbEzdwlFoKgiFLZB6PKU5',
  }
}
