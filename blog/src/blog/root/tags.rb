require "apps/content/root/tags"

class Resource < Content::TagsResource

    def get
        super
        @scope["window_title"] = "Tags"
    end
    
end

