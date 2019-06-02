#!/usr/bin/ruby -rweb/application/standalone

require "apps/content/root/tags/id"

require "blog/mixins/side"

class Resource < Content::TagIdResource
 
    include SideMixin
    
    def get
        super
        sidebar
    end
 
end
