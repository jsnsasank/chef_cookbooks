#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
if node["platform"] == "ubuntu"
  execute "apt-get update -y"
end

package "apache2" do
	package_name  node["apache"]["package"]
	action	:install
end

node["apache"]["sites"].each do |sitename, data|
  doc_root = "/content/sites/#{sitename}"

  directory doc_root do
    mode "0755"
    recursive true
  end
  
if node["platform"] == "ubuntu"
  template_loc = "/etc/apache2/sites-enabled/#{sitename}.conf"
elsif node["platform"] == "centos"
  template_loc = "/etc/httpd/conf.d/#{sitename}.conf"
end

  template template_loc do
    source "vhost.erb"
    mode  "0644"
    variables(
      :doc_root => doc_root,
      :port     => data["port"],
      :domain   => data["domain"]
    )
    notifies  :restart, "service[apache2]"
  end

  template "/content/sites/#{sitename}/index.html" do
    source "index.html.erb"
    mode  "0644"
    variables(
    	:site_title  => data["site_title"],
        :comingsoon  =>  "Coming soon",
	:author_name =>  node["author"]["name"]
    )
  end

  
end

service "apache2" do
	service_name  node["apache"]["package"]
	action [:enable, :start]
end 

include_recipe "php::default"
