require "apps/content/model/article"

class Article
    
    def self.db_update_callback(id = nil)
        Web::Caching.remove_cached_output("/index.html")
    end
    
end
