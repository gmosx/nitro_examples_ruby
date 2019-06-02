require "apps/content/root/categories/id"

require "blog/mixins/side"

class Resource < Content::CategoryIdResource
    include SideMixin

    def get
        super
        sidebar
    end    

end
