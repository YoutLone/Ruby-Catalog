require 'json'

class Author
  attr_accessor :first_name, :last_name
  attr_reader :id, :items

  DATA_FILE = 'JSON/'.freeze

  def initialize(first_name, last_name)
    @id = Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.author = self
    @items << item
  end

  def list_authors
    if @authors.empty?
      puts 'There are no authors'
    else
      @authors.each_with_index do |author, i|
        puts "#{i + 1}) First name: #{author.first_name}, Last name: #{author.last_name}"
      end
    end
  end

  def load_authors
    return [] unless File.exist?("#{DATA_FILE}author.json")

    author_data = JSON.parse(File.read("#{DATA_FILE}author.json"))
    authors = []
    author_data['Authors'].map { |data| authors << Author.new(data['first_name'], data['last_name']) }
    authors
  end
end
