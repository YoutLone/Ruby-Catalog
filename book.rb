require_relative './item'
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
end