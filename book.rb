require_relative './item'
require 'json'

class Book < Item
    attr_reader :publish_date, :publisher, :cover_state, :label
    def initialize(publisher:, cover_state:, publish_date:, label:)
        @publisher = publisher
        @cover_state = cover_state
        @label = label
        super(publish_date: publish_date)
    end

    def can_be_archived?()
        super || cover_state = "bad"
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
                publish_date: book.publish_date,
                label: {
                    id: book.label.id,
                    title: book.label.title,
                    color: book.label.title
                }
            }
        end

        File.write('books.json', JSON.pretty_generate(books))
        puts "Books Saved successfully ..."
    end

    def self.display
        all.each do |book| 
            puts "ID: #{book.id}"
            puts "Publisher: #{book.publisher}"
            puts "Cover State: #{book.cover_state}"
            puts "Label: #{book.label.title}"
            puts "Published Date: #{book.publish_date}"
            puts '_____________________________________________'
        end
    end

    def self.load_books
        if File.exist?('books.json')
        books_file = File.read('books.json')
            if books_file.empty?
                puts "No books saved yet"
            else
                books = JSON.parse(books_file)
                puts "Books: "
                books.each do |book|
                    puts "ID: #{book['id']}"
                    puts "Publisher: #{book['publisher']}"
                    puts "Cover State: #{book['cover_state']}"
                    puts "Label: #{book['label']['title']}"
                    puts "Published Date: #{book['publish_date']}"
                    puts '_____________________________________________'
                end
            end
        else
            puts " Books file do not exist"
        end
    end
end