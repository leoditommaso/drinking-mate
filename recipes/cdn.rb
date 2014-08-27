package 'nginx'

cookbook_file "/etc/nginx/nginx.conf" do
  source "cdn/etc/nginx/nginx.conf"
  mode "0644"
end

cookbook_file "/etc/nginx/sites-available/default" do
  source "cdn/etc/nginx/sites-available/default"
  mode "0644"
end

directory "/var/cache/nginx" do
  owner "www-data"
  group "www-data"
  mode "0755"
end

service "nginx" do
  action :restart
end
