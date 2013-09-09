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
include_recipe 'mirth_connect'