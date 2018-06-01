Exec {
  environment => ["HOME=/home/vagrant"]
}

# Python Environment

package { 'python3':
  ensure => installed,
}

exec { 'pip3-install':
  command => "/usr/bin/curl -o- https://bootstrap.pypa.io/get-pip.py | python3",
  require => Package['python3']
}

package { 'awscli':
  ensure => installed,
  provider => pip3,
  require => Exec['pip3-install']
}

# Node Environment via NVM

exec { 'nvm-install':
  command => '/usr/bin/curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash',
  user => vagrant
}
