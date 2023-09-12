require_relative 'spec_helper'

describe Genre do
  before(:each) do
    @genre = Genre.new(name: 'Rock')
    @music_album = MusicAlbum.new(on_spotify: true, published_date: '20-05-2020', genre: @genre)
  end

  describe '#new' do
    context 'When creating a new genre' do
      it 'should return a genre object' do
        expect(@genre).to be_an_instance_of Genre
      end

      it 'should have a name' do
        expect(@genre.name).to eq 'Rock'
      end

      it 'should have an ID' do
        expect(@genre.id).to be_an_instance_of Integer
      end

      it 'should have an empty items array' do
        expect(@genre.items).to be_an_instance_of Array
        expect(@genre.items).to be_empty
      end
    end
  end

  describe '#add_item' do
    context 'When adding an item to the genre' do
      it 'should associate the genre with the item' do
        expect(@music_album.genre).to eq @genre
      end
    end
  end
end
