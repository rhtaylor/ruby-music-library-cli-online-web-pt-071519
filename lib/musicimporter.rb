
require_relative "./song.rb"
require_relative "./genre.rb"
require_relative "./artist.rb"
require_relative "./concerns/module.rb"
require 'pry'
class MusicImporter
  #path = "./spec/fixtures/mp3s"
    attr_accessor :path
    def initialize(path = "./db/mp3s/")
        @path = path
    end
    def files
      @files = Dir["#{@path}/*.mp3"]

      @files = @files.join("")
      @files = @files.split("#{path}/")
      @files.shift
      @files
        end

    def import
      files
        @files.each do |x|

        Song.create_from_filename(x)
      end


    end

end
