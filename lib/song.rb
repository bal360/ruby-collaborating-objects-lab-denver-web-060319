require 'pry'

class Song
    attr_accessor :name, :artist 
    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song = Song.new(filename.split("-")[1].strip)
        song.artist = Artist.new(filename.split("-")[0].strip)
        song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end