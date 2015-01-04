%w/openssl openssl-devel readline-devel gcc make git samba-client libyaml-devel/.each do |pkg|
  package pkg do
    action :install
  end
end
