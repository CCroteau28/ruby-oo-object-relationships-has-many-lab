class Artist
    attr_accessor :name, :songs
    
    @@song_count = 0

    def initialize(name)
        @name = name
        @songs = []
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        @songs << song
        song.artist = self
        @@song_count += 1
    end

    def add_song_by_name(name_of_song)
        song = Song.new(name_of_song)
        @@song_count += 1
        self.add_song(song)
        song
    end

    def self.song_count
        @@song_count += 1
    end
end 
