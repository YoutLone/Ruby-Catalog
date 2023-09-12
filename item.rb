require 'date'

class Item
  attr_reader :id
<<<<<<< HEAD
  attr_accessor :publish_date, :archived

  def initialize(publish_date:, archived: false)
    @id = Random.rand(1..1000)
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = publish_date
    @archived = archived
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def can_be_archived?
    publish_year = Date.strptime(@publish_date, '%d-%m-%Y')
    Time.now.year - publish_year.to_i > 10
  end

=======
  attr_accessor :published_date, :archived

  def initialize(published_date:, archived: false)
    @id = Random.rand(1..1000)
    @published_date = published_date
    @archived = archived
  end

  def can_be_archived?
    publish_year = Date.strptime(@published_date, '%d-%m-%Y')
    Time.now.year - publish_year.to_i > 10
  end

>>>>>>> fe4e4c95d6d49e792d9253a7b8aa477af1a4f9f5
  def move_to_archive?
    can_be_archived? == true
  end

  private :can_be_archived?
<<<<<<< HEAD
=======

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
>>>>>>> fe4e4c95d6d49e792d9253a7b8aa477af1a4f9f5
end
