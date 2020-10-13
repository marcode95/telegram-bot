require_relative '../lib/processor.rb'

describe Processor do
  let(:testone) { Processor.new(1) }
  let(:testtwo) { Processor.new(24) }

  describe '#name' do
    it 'returns name of pokemon' do
      expect(testone.name).to eql('Ivysaur')
    end
    it 'returns name of pokemon' do
      expect(testtwo.name).to eql('Pikachu')
    end
    it 'capitalizes the name' do
      expect(testtwo.name).not_to eql('pikachu')
    end
  end
  describe '#link' do
    it 'returns link of picture of pokemon' do
      expect(testone.image_link).to eql("https://pokeres.bastionbot.org/images/pokemon/2.png")
    end
    it 'returns link of picture of pokemon' do
      expect(testtwo.image_link).to eql("https://pokeres.bastionbot.org/images/pokemon/25.png")
    end
  end
  describe '#number' do
    it 'returns number of pokemon' do
      expect(testone.number).to eql(2)
    end
    it 'returns number of pokemon' do
      expect(testtwo.number).to eql(25)
    end
  end
  describe '#types' do
    it 'returns type of pokemon' do
      expect(testone.types).to eql('Grass, Poison')
    end
    it 'returns type of pokemon' do
      expect(testtwo.types).to eql('Electric')
    end
    it 'it capitalizes the type' do
      expect(testtwo.types).not_to eql('electric')
    end
  end
  # rubocop:disable Layout/LineLength
  describe '#description' do
    it 'returns description of pokemon' do
      expect(testone.description).to eql('When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs.')
    end
    it 'returns description of pokemon' do
      expect(testtwo.description).to eql('When several of these POKéMON gather, their electricity could build and cause lightning storms.')
    end
  end
  # rubocop:enable Layout/LineLength
end
