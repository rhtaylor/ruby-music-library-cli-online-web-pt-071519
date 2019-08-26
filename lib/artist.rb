
require_relative "./song.rb"
require_relative "./genre.rb"
require_relative "./concerns/module.rb"
require 'pry'
class Artist
 @@all = []
 attr_accessor :name, :song, :songs, :artist
 extend Concerns::Findable

 def initialize(name, song = nil, genre = nil)
   #@@all << self
   @song = song
   @songs = []
   @name = name
   @my_genres = []
 end

 def artist=(new_artist)

   @artist = new_artist

   new_artist.add_song(self)
 end

 def songs=(new_song)
    #if !(songs.include? song)
   @songs << new_song
 #end
 end
 def songs
   @songs
 end
 def Song.artist
   Song.artist = self
 end
 def self.all
   @@all
 end
 def self.destroy_all
   @@all.clear
 end
 def save
   @@all << self
 end
 def self.create(new_artist)
   yo = self.new(new_artist)
   yo.save
   yo
 end
 def add_song(song)

    if !(songs.include? song)

      songs << song
    end
    if !(song.artist)
      song.artist = self
    end
    #  !(songs.include? song)
    #   songs << song



  end

def genres

  @songs.collect{ |song| song.genre }.uniq

  #   Song.all.collect do  |song|
  #
  #     if song.artist == self
  #       @my_genres << song.genre
  #     end
  #   end
  # end
  #
  # @my_genres.uniq
end
 end
