require_relative 'spec_helper'

describe Label do
  before :each do
    @label = Label.new(title: 'Naruto', color: 'black')
  end

  describe '#new' do
    context 'When creating a new label' do
      it 'should be an instance of Label class ' do
        expect(@label).to be_an_instance_of Label
      end

      it 'should return correct title' do
        expect(@label.title).to eq 'Naruto'
      end

      it 'should return correct color' do
        expect(@label.color).to eq 'black'
      end
    end
  end
end
