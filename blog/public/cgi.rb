#!/usr/bin/ruby

begin

    $DBG = true

    Dir.chdir(File.expand_path(File.join(File.dirname($0), "..")))
    $LOAD_PATH.unshift("/home/gmosx/c/nitro/lib", "/home/gmosx/c/plasma/lib") if $DBG
    $LOAD_PATH.unshift("lib", "src")

    require "rubygems"
    require "rack"
    require "blog"

    Web::Application.new.run(:adapter => :cgi)

rescue Object => ex
    STDOUT.print "Status: 500\r\n"
    STDOUT.print "Content-Type: text/html\r\n"
    STDOUT.print "\r\n"
    STDOUT.print "Internal Server Error:<br />"\
                 "#{ex.class}: #{ex.message}<br />"\
                 "#{(ex.backtrace() || []).join('<br />')}"    
end

