require_relative '../game'

describe Game do
  describe '#can_be_archived?' do
    context 'Return Boolean based on difference between published date and difference between last played time' do
      it 'when the difference is greater than ten years and difference between last played time
      and present time is greater that 2 it should return true' do
        game = Game.new('Yes', '2019/01/01', '2001/01/01')
        expect(game.can_be_archived?).to eq(true)
      end

      it 'when the difference is less than ten years and difference between last played
      time and present time is greater that 2 it should return flase' do
        game = Game.new('Single Player', '2017/01/01', '2022/03/07')
        expect(game.can_be_archived?).to eq(false)
      end

      it 'when the difference is greater than ten years and difference between last played
      time and present time is less that 2 it should return false' do
        game = Game.new('No', '2022/09/27', '2005/05/22')
        expect(game.can_be_archived?).to eq(false)
      end

      it 'when the difference is less than ten years and difference between last played
      time and present time is less that 2 it should return false' do
        game = Game.new('No', '2022/09/27', '2022/05/18')
        expect(game.can_be_archived?).to eq(false)
      end
    end
  end

  describe '#Should validate user input' do
    context 'when user inputs multiplayer' do
      it 'returns correct value of multiplayer' do
        game = Game.new('Single Player', '2017/01/01', '2022/03/07')
        expect(game.multiplayer).to eq('Single Player')
      end

      it 'returns correct date of last_played_at' do
        game = Game.new('No', '2022/09/27', '2022/05/18')
        expected_date = Date.parse('2022/09/27')
        expect(game.last_played_at).to eq(expected_date)
      end

      it 'returns correct publish_date' do
        game = Game.new('Yes', '2019/01/01', '2001/01/01')
        expected_date = Date.parse('2001/01/01')
        expect(game.publish_date).to eq(expected_date)
      end
    end
  end
end
