#
# Cookbook:: test
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
directory '/var/www/customers/public_html/' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

file '/var/www/customers/public_html/index.php' do
  content '<html>This is a placeholder for the home page.</html>'
  mode '0755'
  #owner 'web_admin'
  #group 'web_admin'
end

package "git"

package 'Install Apache' do
  case node[:platform]
  when 'redhat', 'centos'
    package_name 'httpd'
  when 'ubuntu', 'debian'
    package_name 'apache2'
  end
end

# package 'apache2' do
  # options '--no-install-recommends'
# end

service "httpd" do
  # action [:start ,:enable]
# end
