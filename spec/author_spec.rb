require_relative 'spec_helper'

describe Author do
  before :each do
    @author = Author.new('George', 'Martin')
  end

  context 'test add item method' do
    it 'should return an array of item' do
      item = Item.new('2009/09/13', archived: false)
      @author.add_item(item)
      expect(@author.items).to eq([item])
    end
  end

  context '#test Author' do
    @author = Author.new('George', 'Martin')
    it 'should return correct first name of author' do
      expect(@author.first_name).to eq('George')
    end

    it 'should return correct last name of author' do
      expect(@author.last_name).to eq('Martin')
    end
  end
end
