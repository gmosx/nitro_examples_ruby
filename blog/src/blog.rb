#!/usr/bin/env ruby

require "db"
require "web"

require "web/mixins/pager"
require "web/mixins/caching/output"
require "apps/id/mixins/helpers"

class Web::Resource
    include Web::Pager
    include Web::Caching
    include Id::Helpers
end

Web::Application.new.run(:adapter => :mongrel) if $0 == __FILE__
