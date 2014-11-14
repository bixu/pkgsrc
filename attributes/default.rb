default['pkgsrc']['repo_hosts'] = ["http://pkgsrc.joyent.com"]  # add other repo urls if you use your own pkgsrc mirror
default['pkgsrc']['repo_path'] = "packages"

default['pkgsrc']['upstream_url'] = "rsync://pkgsrc.joyent.com/pkgsrc-joyent/"
default['pkgsrc']['local_mirror'] = "/opt/local/share/examples/nginx/html/pkgsrc-joyent/"
default['pkgsrc']['platform'] = `head -n1 < /etc/release | awk '{print $1}'`.strip
default['pkgsrc']['release'] = `grep release /etc/pkgsrc_version | awk '{print $2}'`.strip
default['pkgsrc']['architecture'] = `grep architecture /etc/pkgsrc_version | awk '{print $2}'`.strip

default['pkgsrc']['security_updates_interval'] = 7 # interval to attempt security updates, in days
