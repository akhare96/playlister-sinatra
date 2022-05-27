require_relative './concerns/slugfiable'
class Song < ActiveRecord::Base
    
    extend Slugfiable::ClassMethods
    include Slugfiable::InstanceMethods

    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres
    
end