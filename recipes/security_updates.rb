execute "update vulnerability list" do
  # update only if the remote vulns bundle has been updated (-u)
  command "pkg_admin fetch-pkg-vulnerabilities -u"
end

execute "install security udpates" do
  command 'for package in $(pkg_admin audit | cut -d" " -f 2 | cut -d"-" -f 1 | uniq); do pkgin -y install $package; done'
end