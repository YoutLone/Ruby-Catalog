require_relative 'spec_helper'

describe Book do
    before :each do
        @label = Label.new(title: 'Naruto', color: 'black')
        @book = Book.new(publisher: 'htet', cover_state: 'bad', publish_date: '2/12/2020', label: @label)
    end

    describe '#new' do
        context 'when creating a new book' do
            it 'should be an instance of a book class' do
                expect(@book).to be_an_instance_of Book
            end

            it 'should return correct cover state' do
                expect(@book.cover_state).to eq 'bad'
            end

            it 'should return correct publish date' do
                expect(@book.publish_date).to eq '2/12/2020'
            end

            it 'should return correct label' do
                expect(@book.label).to be @label
            end
        end
    end
end