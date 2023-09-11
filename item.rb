require 'date'

class Item
  attr_reader :id
  attr_accessor :publish_date, :archived

  def initialize(publish_date:, archived: false)
    @id = Random.rand(1..1000)
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    publish_year = Date.strptime(@publish_date, '%d-%m-%Y');
    Time.now.year - publish_year.to_i > 10
  end

  def move_to_archive?
    can_be_archived? == true
  end

  private :can_be_archived?
end
