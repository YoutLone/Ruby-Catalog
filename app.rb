require 'json'
require_relative 'book'
require_relative 'label'
require_relative 'music_album'
require_relative 'genre'
require_relative 'game'
require_relative 'author'
require_relative 'game_disp'

class App
  include GameDisp
  attr_accessor :books, :music_albums, :games, :authors

  def initialize
    @games = []
    @authors = []
    retrieve_data
  end

  def self.list_books
    Book.display
  end

  def self.add_book
    puts 'Add a book to library'
    print 'Enter Publisher: '
    publisher = gets.chomp
    print 'Enter Cover State: '
    cover_state = gets.chomp
    print 'Enter Publish Date: '
    publish_date = gets.chomp
    print 'Enter Label: '
    label = gets.chomp
    label = Label.new(title: label)
    Book.new(publisher: publisher, cover_state: cover_state, publish_date: publish_date, label: label)
    puts 'Book added successfully'
  end

  def self.list_all_labels
    Label.display
  end

  def self.save_and_exit
    Book.save
    Label.save
    MusicAlbum.save
    Genre.save
  end

  def self.load_data
    Book.load_books
    Label.load_labels
    MusicAlbum.load_albums
    Genre.load_genres
  end

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
end
