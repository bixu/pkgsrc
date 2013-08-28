template "/opt/local/etc/pkgin/repositories.conf" do
  source "repositories.conf.erb"
  mode 0755
  action :nothing
end.run_action(:create)

execute "update pkgsrc database" do
  command "pkgin -y -f update"
  action :nothing
end.run_action(:run)
