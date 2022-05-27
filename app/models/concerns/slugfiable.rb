module Slugfiable
    module InstanceMethods
        def slug
            self.name.gsub(" ", "-").downcase
        end
    end
    module ClassMethods
        def find_by_slug(slugged)
            self.all.find {|song| song.slug == slugged}
        end
    end
end