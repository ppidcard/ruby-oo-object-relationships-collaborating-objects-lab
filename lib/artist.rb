class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(new_artist)
        if (@@all.find{|artist| artist.name == new_artist})
        artist = @@all.select{|artist| artist.name == new_artist}[0]
      else
        artist = self.new(new_artist)
        end
    end

    def print_songs
        songs = Song.all.select{|song| song.artist == self}
        songs.each {|song| puts song.name}
    end
end