require_relative "./song.rb"
require_relative "./artist.rb"
require_relative "./concerns/module.rb"
class Genre
  @@all = []

  attr_accessor :name, :songs
extend Concerns::Findable
  def initialize(name)
    @name = name
    @songs = []

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(new_genre)
    genre = new(new_genre)
    genre.save
    genre
  end

  def artists
    songs.collect{ |song| song.artist }.uniq
  end
  def songs
    @songs
  end
end
