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
  notifies :restart, "service[named]"
end

service "named" do
  action [:enable]
end

# register process monitor
if node['masala_base']['dd_enable'] && !node['masala_base']['dd_api_key'].nil?
  ruby_block "datadog-process-monitor-named" do
    block do
      node.set['masala_base']['dd_proc_mon']['named'] = {
        search_string: ['named'],
        exact_match: true,
        thresholds: {
         critical: [1, 1]
        }
      }
    end
    notifies :run, 'ruby_block[datadog-process-monitors-render]'
  end
end

