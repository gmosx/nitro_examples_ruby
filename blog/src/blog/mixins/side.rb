require "apps/content/model/category"
require "apps/content/model/comment"
require "apps/content/model/tag"

module SideMixin

private

    def sidebar
        @scope.update(
            "user" => session["USER"],
            "categories" => Category.select_all("name, title FROM category ORDER BY title"),
            "latest_comments" => Comment.select_all("c.parent_id, u.name, a.title FROM comment c JOIN article a ON c.parent_id=a.id JOIN user u ON c.author_id=u.id ORDER BY c.created DESC LIMIT 5"),
            "top_tags" => Tag.select_all("name, count FROM tag ORDER BY COUNT DESC LIMIT 5"),
            "search" => google_search,
            "ad_top" => google_ad_728x90,
            "ad_side_top" => google_ad_120x240
        )
    end

    def google_ad_728x90
        <<-EOA
        <script type="text/javascript">
        google_ad_client = "pub-2813971924068096";
        /* gmosx.com leaderboard */
        google_ad_slot = "2560250625";
        google_ad_width = 728;
        google_ad_height = 90;
        </script>
        <script type="text/javascript"
        src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
        </script>
        EOA
    end

    def google_ad_120x240
        <<-EOA
        <script type="text/javascript">
        google_ad_client = "pub-2813971924068096";
        /* gmosx.com  aside */
        google_ad_slot = "2847934553";
        google_ad_width = 120;
        google_ad_height = 240;
        </script>
        <script type="text/javascript"
        src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
        </script>
        EOA
    end

    def google_search
        <<-EOA
        <form action="http://www.google.com/cse" id="cse-search-box">
          <div>
            <input type="hidden" name="cx" value="partner-pub-2813971924068096:inz8r3ixb0c" />
            <input type="hidden" name="ie" value="UTF-8" />
            <input type="text" name="q" size="16" /><br />
            <input type="submit" name="sa" value="Search" style="margin-top: 5px" />
          </div>
        </form>
        <script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=cse-search-box&amp;lang=en"></script>
        EOA
    end
        
end

