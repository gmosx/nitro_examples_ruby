require "apps/content/root/drafts"

class Resource < Content::DraftsResource

    def get
        force_admin!    
        super
        @scope["window_title"] = "Drafts"
    end

end
