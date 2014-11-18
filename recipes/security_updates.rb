execute "update vulnerability list" do
  # update only if the remote vulns bundle has been updated (-u)
  command "pkg_admin fetch-pkg-vulnerabilities -u"
end

bash "install security udpates" do
  code <<-EOH
  for package in $(pkg_admin audit | cut -d" " -f2 | awk 'BEGIN{FS="-[0-9]."}{print $1}' | uniq)
    do pkgin -y install $package
  done
  EOH
end
