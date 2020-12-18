#
# Cookbook:: .
# Recipe:: ubuntu
#
# Copyright:: 2020, The Authors, All Rights Reserved.


apt_update 'update packages' do
    ignore_failure true
    action :update
end

java_pkg = node['tomcat_f1']['java_pkg']
package java_pkg do
    action :install
end

tomcat_pkg = node['tomcat_f1']['tomcat_pkg']
package tomcat_pkg do
    action :install
    notifies :enable,"service[#{tomcat_pkg}]"
end

service tomcat_pkg do
    action :nothing
end

tomcat_addon_pkgs = node['tomcat_f1']['tomcat_addon_pkgs']
package tomcat_addon_pkgs do
    action :install
    notifies :restart, "service[#{tomcat_pkg}]"
end

tomcat_users_xml_location = node['tomcat_f1']['tomcat_users_xml_location']
cookbook_file tomcat_users_xml_location do
    source 'tomcat-users.xml'
    action :create
    notifies :restart, "service[#{tomcat_pkg}]"
end



