%w/openssl openssl-devel readline-devel gcc make git samba-client libyaml-devel libffi-devel mariadb-libs mariadb-devel mariadb-server mariadb postgresql-devel/.each do |pkg|
  package pkg do
    action :install
  end
end
