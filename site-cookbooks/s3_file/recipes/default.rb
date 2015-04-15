#
# Cookbook Name:: s3_file
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
require File.expand_path("../../libraries/s3_file.rb", __FILE__)

%w{gcc ruby-devel libxml2 libxml2-devel libxslt libxslt-devel}.each do |name|
  package name do
    action [:install]
  end
end

%w{nokogiri aws-sdk-v1}.each do |name|
  chef_gem name do
    action :nothing
    subscribes :install, "package[libxslt-devel]", :immediately
  end
end
