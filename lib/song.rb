require_relative "./genre.rb"
require_relative "./artist.rb"
require_relative "./concerns/module.rb"
require 'pry'
class Song
 @@all = []
 attr_accessor :name, :genre #:song
 extend Concerns::Findable
 def initialize(name, artist = nil, genre = nil)
   #@@all << self
   #self.song = (name)
   if artist
   self.artist= (artist)
    end
    if genre
      self.genre = (genre)
      end
      @songs = []
      @name = name
      @genres = []
    end
 def artist=(new_artist = nil)

   @artist = new_artist
   new_artist.add_song(self)
end
  def genre=(genre = nil)
    @genre = genre

    unless genre.songs.include? self
      genre.songs << self
    end
  end
  def genres=(song)
    @genres << song
  end
  def artist
    @artist
  end

 # def songs=(new_song)
 #   @@all << new
 #   #@songs << new_song
 # end
 # def songs
 #   @songs
 # end
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
 def self.create(song_name)

   songy = new(song_name)
   songy.save
   songy
 end
 def add_song(song)

   if song.artist.nil? && !(songs.include? song)
     song.artist = self
     songs << song
   else

     if songs.include? song

     else
     songs << song
   end
 end
end


def self.find_by_name(name)
  @@all.detect{|song| song.name == name }

end

def self.find_or_create_by_name(name)

      if  song = self.find_by_name(name)
          song
      else
          self.create(name)

     end

    end

def genres
  songs.tap do |song|
    genres << song
    @genres
 end
end

def self.new_from_filename(name)
    song_name = name.split(" - ")[1]
    artist_name = name.split(" - ")[0]
    genre_name = name.split(" - ")[2].chomp(".mp3")
    song = self.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

    # y = x.collect{ |sy| sy.gsub(".mp3", "")}
    # y[0] = artist
    # y[1] = name
    # y[2] = genre
    # new_file = Song.new(name, artist, genre)
def self.create_from_filename(name)
    @@all << self.new_from_filename(name)
end

end
