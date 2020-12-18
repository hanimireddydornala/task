#
# Cookbook:: tomcat_f1
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

if platform?('ubuntu')
    include_recipe 'tomcat_f1::ubuntu'
end