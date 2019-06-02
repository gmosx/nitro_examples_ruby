require "blog/model"

class Resource < Web::Resource
    
    def get
        @scope.update(
            "classes" => DB::Managed.subclasses.map { |c| c.name },
            "XSL" => "/dbedit/dbedit.xsl"
        )
    end
    
end
