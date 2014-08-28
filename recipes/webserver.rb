package 'git'
package 'nginx'
package 'php5-fpm'
package 'php5-mysqlnd'

cookbook_file "/etc/nginx/nginx.conf" do
  source "webserver/etc/nginx/nginx.conf"
  mode "0644"
end

cookbook_file "/etc/nginx/sites-available/default" do
  source "webserver/etc/nginx/sites-available/default"
  mode "0644"
end

cookbook_file "/opt/install-site.sh" do
  source "webserver/install-site.sh"
  owner "root"
  group "root"
  mode "0750"
end

directory "/opt/applications" do
  mode "0755"
end

execute "install-site" do
  command "/bin/bash /opt/install-site.sh"
  action :run
end

service "nginx" do
  action :restart
end
