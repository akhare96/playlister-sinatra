require_relative './concerns/slugfiable'
class Genre < ActiveRecord::Base
    
    extend Slugfiable::ClassMethods
    include Slugfiable::InstanceMethods

    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
    
end