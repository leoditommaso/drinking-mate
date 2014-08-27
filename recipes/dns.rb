package 'bind9'

directory "/etc/bind/default_zones" do
  owner "root"
  group "bind"
  mode "0755"
end

%w(db.0 db.127 db.255 db.empty db.local db.root).each do |file|
  cookbook_file "/etc/bind/default_zones/#{file}" do
    source "dns/etc/bind/default_zones/#{file}"
    owner "root"
    group "bind"
    mode "0644"
  end
end

directory "/etc/bind/domain_zones" do
  owner "root"
  group "bind"
  mode "0755"
end

%w(db.redes.unlp_africa db.redes.unlp_africa db.redes.unlp_america
db.redes.unlp_asia db.redes.unlp_europa db.redes.unlp_root).each do |file|
  cookbook_file "/etc/bind/domain_zones/#{file}" do
    source "dns/etc/bind/domain_zones/#{file}"
    owner "root"
    group "bind"
    mode "0644"
  end
end

cookbook_file "/etc/bind/named.conf" do
  source "dns/etc/bind/named.conf"
  owner "root"
  group "bind"
  mode "0644"
end

cookbook_file "/etc/bind/named.conf.local" do
  source "dns/etc/bind/named.conf.local"
  owner "root"
  group "bind"
  mode "0644"
end

service "bind9" do
  action :restart
end
