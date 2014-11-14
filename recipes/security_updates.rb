execute "update vulnerability list" do
  # update only if the remote vulns bundle has been updated (-u)
  command "pkgin -y -f update && pkg_admin fetch-pkg-vulnerabilities -u"
  not_if "find /var/db/pkgin/pkg_admin_audit_done -mtime -#{node['pkgsrc']['security_updates_interval']} | grep pkg_admin_audit_done"
end

execute "install security udpates" do
  command 'for package in $(pkg_admin audit | cut -d" " -f 2 | cut -d"-" -f 1 | uniq); do pkgin -y install $package; done'
  not_if "find /var/db/pkgin/pkg_admin_audit_done -mtime -#{node['pkgsrc']['security_updates_interval']} | grep pkg_admin_audit_done"
end

execute "write timestamp file" do
  command 'touch /var/db/pkgin/pkg_admin_audit_done'
  not_if "find /var/db/pkgin/pkg_admin_audit_done -mtime -#{node['pkgsrc']['security_updates_interval']} | grep pkg_admin_audit_done"
end