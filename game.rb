require 'date'
require_relative 'item'

class Game < Item
  attr_reader :multiplayer, :last_played_at, :publish_date

  DATA_FOLDER = 'JSON/'.freeze

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    super && (Time.now.year - @last_played_at.year) > 2
  end

  def create_game(multiplayer, last_played_at, publish_date)
    game = Game.new(multiplayer, last_played_at, publish_date)
    @games << game
  end

  def list_games
    if @games.empty?
      puts 'There are no games'
    else
      @games.each_with_index do |game, i|
        lpa = game.last_played_at
        puts "#{i + 1}) Multiplayer: #{game.multiplayer}, last played: #{lpa}, published: #{game.publish_date}"
      end
    end
  end

  def save_games(games)
    File.open("#{DATA_FOLDER}games.json", 'w') do |file|
      data = {
        'Games' => games.map do |game|
          {
            'multiplayer' => game.multiplayer,
            'last_played_at' => game.last_played_at,
            'publish_date' => game.publish_date,
            'id' => game.id
          }
        end
      }
      file.write(JSON.pretty_generate(data))
    end
  end

  def load_games
    return [] unless File.exist?("#{DATA_FOLDER}games.json")

    data = JSON.parse(File.read("#{DATA_FOLDER}games.json"))
    games = []
    data['Games'].map do |game_data|
      games << Game.new(game_data['multiplayer'], game_data['last_played_at'], game_data['publish_date'])
    end
    games
  end
end
