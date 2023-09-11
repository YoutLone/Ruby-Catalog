class Label
    attr_reader :id
    attr_accessor :title, :color, :items
    def initialize(title:, color: "white")
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
end