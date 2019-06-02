require "apps/content/root/articles/id"

require "blog/model/article"

class Resource < Content::ArticleIdResource

    def get
        super
    end

end
