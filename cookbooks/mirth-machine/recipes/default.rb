#
# Cookbook Name:: test-interface
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'
include_recipe 'build-essential'
package "expect" do
  action :install
end
include_recipe 'java::oracle'
include_recipe 'openvpn'

remote_file "mirth_installer.sh" do 
  source "http://downloads.mirthcorp.com/connect/2.2.3.6825.b80/mirthconnect-2.2.3.6825.b80-unix.sh"
  not_if "[ -f /mirth_installer.sh ]"
end
script "install_mirth" do
  interpreter "bash"
  user "root"
  code <<-EOH
    chmod +x /mirth_installer.sh
    expect -c'
      spawn sudo /mirth_installer.sh
      expect "This will install Mirth Connect on your computer."
      send "o\r"
      send "\r"
      send "\r"
      send "\r"
      send "\r"
      send "\r"
      send "\r"
      send "\r"
      send "\r"
      send "\r"
      send "\r"
      send "\r"
      send "\r"
      send "\r"
      send "\r"
      send "\r"
      send "\r"
      send "\r"
      expect "I accept the agreement"
      send "1\r"
      expect "Where should Mirth Connect be installed?"
      send "/opt/mirthconnect\r"
      expect "Please enter a comma-separated list of the selected values"
      send "1,2\r"
      expect "Create symlinks?"
      send "y\r"
      expect "Mirth Connect to create symlinks"
      send "/usr/local/bin\r"
      expect "Web Start Port"
      send "8080\r"
      expect "Administrator Port"
      send "8443\r"
      expect "Server JMX Port"
      send "1099\r"
      expect "Minimum password length"
      send "0\r"
      expect "Minimum number of upper-case characters"
      send "0\r"
      expect "Minimum number of lower-case characters"
      send "0\r"
      expect "Minimum number of numeric characters"
      send "0\r"
      expect "Minimum number of special characters"
      send "0\r"
      expect "Application Data"
      send "\r"
      expect "Application Data"
      send "/opt/mirthconnect/appdata\r"
      expect "Logs"
      send "\r"
      expect "Logs"
      send "/opt/mirthconnect/logs\r"
      expect "Install service?"
      send "y\r"
      expect "Run Mirth Connect Server Manager?"
      send "n\r"
      expect "Yes, I would like to view the README file?"
      send "n\r"
      expect "Finishing installation ..."
      exit
    '
  EOH
  not_if "[ -f /opt/mirthconnect/mcservice ]"
end
script "start_mirth" do
  interpreter "bash"
  user "root"
  code <<-EOH
    /opt/mirthconnect/mcservice restart
  EOH
end
