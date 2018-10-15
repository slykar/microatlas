# frozen_string_literal: true

# -*- mode: ruby -*-
# vim: set ft=ruby ts=2 sw=2 :

Vagrant.configure('2') do |config|

  config.vm.box = 'bento/ubuntu-17.10'

  config.vm.network 'private_network', ip: '192.168.99.100'

  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'microatlas'
    vb.memory = 1024
    vb.cpus = 2
  end

  config.vm.synced_folder "~/projects", "/projects"

  # Runs as root user
  config.vm.provision 'shell', inline: <<~SHELL
    export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"

    # Import the Docker, Google Cloud public keys
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    # Add repositories
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
    echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

    apt-get update -y
    apt-get install -y docker-ce puppet google-cloud-sdk kubectl
  SHELL

  config.vm.provision 'puppet' do |puppet|
    puppet.manifests_path = 'vagrant/manifests'
  end
end
