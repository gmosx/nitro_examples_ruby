$DBG = true

$LOAD_PATH.unshift("/home/gmosx/c/nitro/lib", "/home/gmosx/c/plasma/lib") if $DBG
$LOAD_PATH.unshift("lib", "src")

require "example"

run Web::Application.new.start

