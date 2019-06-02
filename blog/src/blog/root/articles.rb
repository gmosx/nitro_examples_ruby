require "apps/content/root/articles"

require "blog/model/article"


class Resource < Content::ArticlesResource

    def post
        force_admin!
        super
    end

end
