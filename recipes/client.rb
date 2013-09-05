template "/opt/local/etc/pkgin/repositories.conf" do
  source "repositories.conf.erb"
  mode 0755
  notifies :run, 'execute[update pkgsrc database]', :immediately
end

execute "update pkgsrc database" do
  command "pkgin -y list"
  action :nothing
end
