#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

nodejs_npm 'gulp'
nodejs_npm 'gulp-util'
nodejs_npm 'coffee-script'
nodejs_npm 'bower'

execute 'change timezone' do
  not_if 'diff /usr/share/zoneinfo/Japan /etc/localtime > /dev/null 2>&1'
  command 'cp -p /usr/share/zoneinfo/Japan /etc/localtime'
end

%w/ImageMagick ImageMagick-devel libxml2 libxml2-devel libxslt libxslt-devel/.each do |pkg|
  package pkg do
    action :install
  end
end

directory '/home/webservice' do
  owner 'webservice'
  group 'webservice'
  mode 0755
  action :create
end

directory '/home/webservice/projects' do
  owner 'webservice'
  group 'webservice'
  mode 0755
  action :create
end

RUBY_VERSION = '2.2.2'
ruby_build_ruby RUBY_VERSION do
  action :install
end

%w/bundler padrino/.each do |g|
  gem_package g do
    gem_binary "/usr/local/ruby/#{RUBY_VERSION}/bin/gem"
  end
end

gem_package 'aws-sdk-v1'

cookbook_file '/home/webservice/.git-completion.bash' do
  source 'git-completion.bash'
  owner 'webservice'
  group 'webservice'
  mode '0644'
  action :create
end

cookbook_file '/home/webservice/.git-prompt.sh' do
  source 'git-prompt.sh'
  owner 'webservice'
  group 'webservice'
  mode '0644'
  action :create
end

cookbook_file '/home/webservice/.bash_profile' do
  source 'bash_profile'
  owner 'webservice'
  group 'webservice'
  mode '0644'
  action :create
end

cookbook_file '/home/webservice/.bashrc' do
  source 'bashrc'
  owner 'webservice'
  group 'webservice'
  mode '0644'
  action :create
end

directory '/opt/bizevo' do
  owner 'webservice'
  group 'webservice'
  mode 0755
  action :create
end

service 'mariadb' do
  action [:start]
end

execute 'postgresql-setup' do
  not_if  { File.exists? '/var/lib/pgsql/data/PG_VERSION' }
  command 'postgresql-setup initdb'
end

service 'postgresql.service' do
  action [:start]
end

service 'smb' do
  action [:enable, :start]
end

service 'firewalld' do
  action [:disable, :stop]
end

service 'postfix' do
  action [:enable, :start]
end
