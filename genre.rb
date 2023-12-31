require 'json'

class Genre
  attr_reader :id
  attr_accessor :name, :items

  def initialize(name:)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items << item
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.save
    genres = []
    all.each do |genre|
      genres << {
        id: genre.id,
        name: genre.name
      }
    end

    File.write('genres.json', JSON.pretty_generate(genres))
    'Genres saved to genres.json'
  end

  def self.load_genres
    if File.exist?('genres.json')
      genres_file = File.read('genres.json')
      if genres_file.empty?
        puts 'No genres saved yet'
        puts '____________________'
      else
        genres = JSON.parse(genres_file)
        genres.each do |genre|
          new(name: genre['name'])
        end
      end
    else
      puts ' Genre file does not exist'
    end
  end

  def self.display
    all.each do |genre|
      puts genre.name
      puts '-----------------'
    end
  end
end
