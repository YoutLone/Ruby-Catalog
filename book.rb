require_relative 'item'
require_relative 'label'
require 'json'

class Book < Item
  attr_accessor :published_date, :publisher, :cover_state, :label

  def initialize(publisher:, cover_state:, published_date:, label:)
    @publisher = publisher
    @cover_state = cover_state
    @label = label
    super(published_date: published_date)
  end

  def can_be_archived?()
    super || cover_state == 'bad'
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.save
    books = []
    all.each do |book|
      books << {
        id: book.id,
        publisher: book.publisher,
        cover_state: book.cover_state,
        published_date: book.published_date,
        label: {
          id: book.label.id,
          title: book.label.title,
          color: book.label.title
        }
      }
    end

    File.write('books.json', JSON.pretty_generate(books))
  end

  def self.load_books
    if File.exist?('books.json')
      books_file = File.read('books.json')
      if books_file.empty?
        puts 'No books saved yet'
      else
        books = JSON.parse(books_file)
        books.each do |book|
          new(
            publisher: book['publisher'],
            cover_state: book['cover_state'],
            label: Label.new(title: book['label']['title']),
            published_date: book['published_date']
          )
        end
      end
    else
      puts ' Books file do not exist'
    end
  end

  def self.display
    all.each do |book|
      puts "ID: #{book.id}"
      puts "Publisher: #{book.publisher}"
      puts "Cover State: #{book.cover_state}"
      puts "Label: #{book.label.title}"
      puts "Published Date: #{book.published_date}"
      puts '_____________________________________________'
    end
  end
end
