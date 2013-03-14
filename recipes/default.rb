#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

tomcat_version = node['tomcat']['version'].to_i

if platform?("centos","redhat","fedora")
  package "tomcat#{tomcat_version}" do
    action :install
    supports :restart => true, :reload => true, :status => true
  end
end

service "tomcat" do
  service_name "tomcat#{tomcat_version}"
  case node["platform"]
  when "centos","redhat","fedora"
    supports :restart => true, :reload => true, :status => true
  end
  action [:enable, :start]
end
