require_relative './AnilistObj'

module Anilistrb
    class Media < AnilistObj
        
        def to_s
            out = "["
            "[#{id}] - #{title}"
        end
    end
end