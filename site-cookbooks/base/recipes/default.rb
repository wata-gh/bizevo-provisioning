#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
yum_repository 'epel' do
  description 'Extra Packages for Enterprise Linux'
  mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-7&arch=$basearch'
  gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7'
  action :create
end

%w/openssl openssl-devel readline-devel gcc make git mariadb-server mariadb-devel/.each do |pkg|
  package pkg do
    action :install
  end
end

nodejs_npm 'gulp'

execute 'change timezone' do
  not_if 'diff /usr/share/zoneinfo/Japan /etc/localtime > /dev/null 2>&1'
  command 'cp -p /usr/share/zoneinfo/Japan /etc/localtime'
end

package 'ImageMagick'
package 'ImageMagick-devel'
package 'libxml2-devel'
package 'libxslt'
package 'libxslt-devel'

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

ruby_build_ruby '2.1.3' do
  action :install
end

%w/bundler padrino/.each do |g|
  gem_package g do
    gem_binary '/usr/local/ruby/2.1.3/bin/gem'
  end
end

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

#samba_user "webservice" do
#  password "webservice!"
#  action [:create, :enable]
#end
