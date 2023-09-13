require 'date'

class Item
  attr_reader :id
  attr_accessor :published_date, :author, :source, :archived

  def initialize(published_date:, archived: false)
    @id = Random.rand(0..1000)
    @published_date = published_date
    @archived = archived
  end

  def can_be_archived?
    publish_year = Date.strptime(@published_date, '%d-%m-%Y')
    Time.now.year - publish_year.to_i > 10
  end

  def move_to_archive?
    can_be_archived? == true
  end

  private :can_be_archived?

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
    published_year = Date.strptime(@published_date, '%d-%m-%Y').strftime('%Y')
    Time.now.year
    published_year.to_i
  end

  def genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end
end
