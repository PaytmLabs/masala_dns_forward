#
# Cookbook Name:: masala_dns_forward
# Recipe:: default
#
# Copyright (C) 2017 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'masala_base::default'

package 'bind'

template "/etc/named.conf" do
  source  "named.conf.erb"
  owner 'root'
  group 'named'
  mode  00644
end

service "named" do
  action [:enable, :start]
end

