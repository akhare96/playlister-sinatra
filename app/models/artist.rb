require_relative './concerns/slugfiable'
class Artist < ActiveRecord::Base

    extend Slugfiable::ClassMethods
    include Slugfiable::InstanceMethods

    has_many :songs
    has_many :genres, through: :songs
    
end