include_recipe "s3_file"
work_dir = "/home/vagrant/work"

directory work_dir do
  owner  "vagrant"
  group  "vagrant"
  mode   "00755"
  action :create
end

node['oracle-instant-client']['rpms'].each do |rpm_path|
  file = File.basename(rpm_path)
  s3_file "#{work_dir}/#{file}" do
    source "s3://#{node['oracle-instant-client']['bucket']}/#{rpm_path}"
    access_key_id 'AKIAIZLZKUXUPFGQLD6A'
    secret_access_key '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'
    owner  "vagrant"
    group  "vagrant"
    mode   "0644"
    action :create
    not_if { File.exists?("#{work_dir}/#{file}") }
  end

  rpm_package "#{file}" do
    source "#{work_dir}/#{file}"
    action :install
  end
end
