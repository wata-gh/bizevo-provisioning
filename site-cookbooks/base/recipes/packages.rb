yum_repository 'epel' do
  description 'Extra Packages for Enterprise Linux'
  mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-7&arch=$basearch'
  gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7'
  action :create
end

%w/openssl openssl-devel readline-devel gcc make git mariadb-server mariadb-devel samba-client/.each do |pkg|
  package pkg do
    action :install
  end
end
