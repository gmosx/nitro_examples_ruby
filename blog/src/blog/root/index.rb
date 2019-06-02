require "apps/content/root/articles"

require "blog/mixins/side"

class Resource < Content::ArticlesResource

    include SideMixin

    def get
        super
        @scope["window_title"] = "Home"
        sidebar
        cache_output!
    end
    
    def post
        force_admin!
        super
    end

end
