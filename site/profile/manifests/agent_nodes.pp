class profile::agent_nodes {
  include dockeragent
  dockeragent::node {'web.puppet.vm':}
  dockeragent::node {'web1.puppet.vm':}
  dockeragent::node {'db.puppet.vm':}
  dockeragent::node {'db1.puppet.vm':}
  dockeragent::node {'minetest.puppet.vm':}
  host {'web.puppet.vm': 
    ensure => present,
    ip     => '172.18.0.2',
  }
  host {'web1.puppet.vm': 
    ensure => present,
    ip     => '172.18.0.5',
  }
  host {'db.puppet.vm':
    ensure => present,
    ip     => '172.18.0.3',
  }
  host {'db1.puppet.vm':
    ensure => present,
    ip     => '172.18.0.6',
  }
  host {'minetest.puppet.vm':
    ensure => present,
    ip     => '172.18.0.4',
  }
}
