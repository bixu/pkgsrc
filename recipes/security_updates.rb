execute "update vulnerability list" do
  # update only if the remote vulns bundle has been updated (-u)
  command "pkgin -y -f update && pkg_admin fetch-pkg-vulnerabilities -u"
  not_if "find /var/db/pkgin/pkg_admin_audit_done -mtime -#{node['pkgsrc']['security_updates_interval']} | grep pkg_admin_audit_done"
end

bash "install security udpates" do
  code <<-EOH
  for package in $(pkg_admin audit | cut -d" " -f2 | awk 'BEGIN{FS="-[0-9]."}{print $1}' | uniq)
    do pkgin -y install $package
  done
  EOH
  not_if "find /var/db/pkgin/pkg_admin_audit_done -mtime -#{node['pkgsrc']['security_updates_interval']} | grep pkg_admin_audit_done"
end

execute "write timestamp file" do
  command 'touch /var/db/pkgin/pkg_admin_audit_done'
  not_if "find /var/db/pkgin/pkg_admin_audit_done -mtime -#{node['pkgsrc']['security_updates_interval']} | grep pkg_admin_audit_done"
end