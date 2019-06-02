#!/usr/bin/env ruby

require "tools/deploy"

d = DeployTool.new("gmosx.com")
d.ssh_key = "~/.ec2/id_rsa-gmosx-keypair"
d.ssh_user = "root@cull.gr"
d.remote_app_dir = "/mnt/var/apps"
d.remote_www_dir = "/mnt/var/www"
d.required_gems = %w{
    rack-0.4.0
    ruby-openid-2.1.2 
    xml-simple-1.0.11
    memcache-client-1.5.0
    libxml-ruby-0.8.3
    libxslt-ruby-0.8.2
    json-1.1.3
}
d.deploy
