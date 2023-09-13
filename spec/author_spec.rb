require_relative 'spec_helper'

describe Author do
  before :each do
    @author = Author.new(first_name: 'oumaima', last_name: 'nejjari')
  end
  describe "#new" do
    context "when creating a new author" do
      it 'should be an instance of a author class ' do
        expect(@author).to be_an_instance_of Author
      end
      it 'should return correct first name' do
        expect(@author.first_name).to eq 'oumaima'
      end
      it 'should return correct last name' do
        expect(@author.last_name).to eq 'nejjari'
      end
    end
  end
end
