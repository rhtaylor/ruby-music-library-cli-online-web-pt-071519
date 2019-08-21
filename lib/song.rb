
class Artist
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end
  def self.all
    @all
  end
end


   class Song
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
  def self.create(new_song)
    yo = self.new(new_song)
    @@all << yo
    yo
  end
end
