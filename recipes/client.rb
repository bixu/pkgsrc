template "/opt/local/etc/pkgin/repositories.conf" do
  source "repositories.conf.erb"
  mode 0755
  action :nothing
end.run_action(:create)

# This will update the pkgsrc database if it has not already
# been done
execute "update pkgsrc database" do
  command "pkgin -y list"
  action :nothing
end.run_action(:run)
