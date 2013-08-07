cron "mirror our pkgsrc upstream" do
  command "rsync -avzP --partial --progress #{node['pkgsrc']['upstream_url']} #{node['pkgsrc']['local_mirror']}"
  hour 3
end

package "nginx"

template "/opt/local/etc/nginx/nginx.conf" do
  source "nginx.conf.erb"
  mode 0644
  notifies :restart, 'service[nginx]'
end

service "nginx" do
supports :restart => true, :enable => true, :disable => true, :reload => true
action :enable
end
