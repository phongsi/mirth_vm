# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 8443, host: 8443

  config.vm.provision :chef_solo do |chef|
    config.omnibus.chef_version = "10.14.2"
    chef.add_recipe("mirth-machine")
    chef.data_bags_path = "data_bags"
    chef.json = {
      "db_address" => ENV["MIRTH_DB_IP"],
      "db_user" => ENV["MIRTH_DB_USER"],
      "db_password" => ENV["MIRTH_DB_PASS"]
    }
  end

  config.vm.provider :virtualbox do |vb, override|
    override.vm.box = "precise64"
    override.vm.box_url = "http://files.vagrantup.com/precise64.box"
    override.vm.network "private_network", ip: "192.168.50.5"
  end

  config.vm.provider :aws do |aws, override|
    override.vm.box = "precise64-aws"
    override.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

    aws.access_key_id = ENV["AWS_KEY"]
    aws.secret_access_key = ENV["AWS_SECRET"]
    aws.keypair_name = ENV["AWS_KEYPAIR"]

    aws.ami = "ami-7747d01e"

    override.ssh.username = ENV["AWS_SSH_USER"]
    override.ssh.private_key_path = ENV["AWS_KEY_PATH"]

    aws.private_ip_address = ENV["MIRTH_AWS_PRIVATE_IP"]
    aws.subnet_id = ENV["AWS_SUBNET_ID"]
    aws.security_groups = [ENV["AWS_SECURITY_GROUP"]]
    aws.elastic_ip = true
  end
end
