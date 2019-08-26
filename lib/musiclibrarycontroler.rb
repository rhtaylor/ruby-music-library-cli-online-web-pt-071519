class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    new_mp3s = MusicImporter.new(path)
    new_mp3s.import
  end

  def call
    input = ""
    while input != "exit"

    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.strip
    case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
end
  end
  def list_songs

    bfd = Song.all.sort{|a,b| a.name <=> b.name }.each.with_index(1) do |s, i|

      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      end

  end
  def list_artists
    Artist.all.sort{|a,b| a.name <=> b.name }.each.with_index(1) do |s, i|
       puts "#{i}. #{s.name}"
    end
  end
  def list_genres
    Genre.all.sort{ |a,b| a.name <=> b.name }.each.with_index(1) do |x,y|
      puts "#{y}. #{x.name}"
  end
end
def list_songs_by_artist
  puts "Please enter the name of an artist:"
  inputs = gets.strip
  if z = Artist.find_by_name(inputs)
    z.songs.sort{ |a,b| a.name <=> b.name }.each.with_index(1) do |s,i|
    puts "#{i}. #{s.name} - #{s.genre.name}"
  end
end
end
def list_songs_by_genre
puts "Please enter the name of a genre:"
input = gets.strip
if genre = Genre.find_by_name(input)

  genre.songs.sort_by(&:name).each.with_index(1) do |s,i|
    puts "#{i}. #{s.artist.name} - #{s.name}"
  end
end
end
def play_song
  puts "Which song number would you like to play?"
  input = gets.strip.to_i
  input
  #
  # x = Song.all.collect.sort{|a,b| a.name <=> b.name }.each.with_index(1){ |a,i| "#{i} #{a.name} #{a.artist.name}"}
   a = Song.all.collect.sort{|a,b| a.artist.name <=> b.artist.name }
   b = Song.all.sort{ |a,b| a.name <=> b.name }


 if input > 0 && input < Song.all.count

   song_name = b[input -1 ].name
   artist_name = b[input - 1 ].artist.name
         puts "Playing #{song_name} by #{artist_name}"
end

end
end
