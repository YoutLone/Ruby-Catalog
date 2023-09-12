require_relative 'music_album'
require_relative 'genre'

class App
  def self.list_music_albums
    MusicAlbum.display
  end

  def self.add_music_album
    puts 'Add Music Album to library'
    print 'Enter Genre: '
    genre = gets.chomp
    genre = Genre.new(name: genre)
    print 'Enter On Spotify [true or false]: '
    on_spotify = gets.chomp.downcase == 'true'
    print 'Enter publish date: '
    published_date = gets.chomp
    MusicAlbum.new(on_spotify: on_spotify, published_date: published_date, genre: genre)
    puts 'Music Album added successfully'
  end

  def self.list_all_genres
    Genre.display
  end

  def self.save_and_exit
    MusicAlbum.save
    Genre.save
  end

  def self.load_data
    MusicAlbum.load_albums
    Genre.load_genres
  end
end
