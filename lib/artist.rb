require_relative './config/environment'

   class Artist
  @@all = []
  attr_accessor :name
  def initialize(name)
    @name = name
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
    @@all << yo
    yo
  end
end
