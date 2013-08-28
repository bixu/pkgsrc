template "/opt/local/etc/pkgin/repositories.conf" do
  source "repositories.conf.erb"
  mode 0755
  action :nothing
end.run_action(:create)
