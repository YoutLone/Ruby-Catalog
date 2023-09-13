require_relative 'spec_helper'
describe Game do
  before :each do
    @author = Author.new(first_name: 'oumaima', last_name: 'nejjari')
    @game = Game.new(name: 'oumaima', multiplayer: 'true', last_played_at: '2020/12/2',
                     published_date: '2020/13/3', author: @author)
  end
  describe '#new' do
    context 'when creating a new game' do
      it 'should be an instance of a book' do
        expect(@game).to be_an_instance_of Game
      end
      it 'should return correct name' do
        expect(@game.name).to eq 'oumaima'
      end
      it 'should return correct multiplayer' do
        expect(@game.multiplayer).to eq 'true'
      end
      it 'should return correct last play at' do
        expect(@game.last_played_at).to eq '2020/12/2'
      end
      it 'should return correct lpublish_date' do
        expect(@game.published_date).to eq '2020/13/3'
      end
    end
  end
end
