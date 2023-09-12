require_relative 'book'
require_relative 'label'

class App
    def self.list_books
        Book.display
    end

    def self.add_book
        puts "Add a book to library"
        print "Enter Publisher: "
        publisher = gets.chomp
        print "Enter Cover State: "
        cover_state = gets.chomp
        print "Enter Publish Date: "
        publish_date = gets.chomp
        print "Enter Label: "
        label = gets.chomp
        label = Label.new(title: label)
        Book.new(publisher: publisher, cover_state: cover_state, publish_date: publish_date, label: label)
        puts "Book added successfully"
    end

    def self.list_all_labels
        Label.display
    end

    def self.save_and_exit
        Book.save
        Label.save
    end

    def self.load_data
        Book.load_books
        Label.load_labels
    end
end