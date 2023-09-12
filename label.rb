require 'json'

class Label
  attr_reader :id
  attr_accessor :title, :color, :items

  def initialize(title:, color: 'white')
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.label = self
    @items << item
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.save
    labels = []
    all.each do |label|
      labels << {
        id: label.id,
        title: label.title,
        color: label.color
      }
    end
    File.write('labels.json', JSON.pretty_generate(labels))
    puts 'Labels Saved SuccessFully'
  end

  def self.load_labels
    if File.exist?('labels.json')
      labels_file = File.read('labels.json')
      if labels_file.empty?
        puts 'No labels saved yet'
        puts '____________________'
      else
        labels = JSON.parse(labels_file)
        labels.each do |label|
          new(
            title: label['title']
          )
        end
      end
    else
      puts ' File does not exist'
    end
  end

  def self.display
    all.each do |label|
      puts "Label Title: #{label.title}"
    end
    puts '_______________________________'
  end
end
