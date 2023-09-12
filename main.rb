require_relative 'app'
require_relative 'music_album'
require_relative 'genre'

puts 'Welcome to Catolog of My Things'.center(50, '#')
puts ''.center(50, '-')

def main
  loop do
    puts ' 1 - List All Books'
    puts ' 2 - List All Music Albums'
    puts ' 3 - List All Games'
    puts " 4 - List All Genres (e.g 'Comedy', 'Thriller')"
    puts " 5 - List All Labels  (e.g. 'Gift', 'New') "
    puts " 6 - List All Authors (e.g. 'Stephen King')"
    puts ' 7 - Add a Book'
    puts ' 8 - Add a Music Album'
    puts ' 9 - Add a Game'
    puts '10 - Save and Exit'
    option = gets.chomp.to_i
    select = Selection.new
    select.choice_method(option)
  end
end
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength

class Selection
  def choice_method(option)
    case option
    when 1
      puts 'list all books'
    when 2
      App.list_music_albums
    when 3
      puts 'list all games'
    when 4
      App.list_all_genres
    when 5
      puts 'list all labels'
    when 6
      puts 'list all authors'
    when 7
      puts 'add a book'
    when 8
      App.add_music_album
    when 9
      puts 'add a game'
    when 10
      App.save_and_exit
      puts 'Exit from the app'
      abort
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength

App.load_data
main
