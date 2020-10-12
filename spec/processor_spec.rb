require_relative '../lib/processor.rb'

describe Processor do
  let(:processor) { Processor.new }

  describe '#find_pkmn' do
    it 'returns data of random pokemon if no argument given' do
      expect(processor.find_pkmn).to include('Name', 'Number', 'Type', 'Description')
    end
    it 'will not raise an error if no argument given' do
      expect { processor.find_pkmn }.not_to raise_error
    end
    # rubocop:disable Layout/LineLength
    it 'returns data of certain pokemon if argument given' do
      expect(processor.find_pkmn(4)).to eql("https://pokeres.bastionbot.org/images/pokemon/5.png\nName: Charmeleon\nNumber: 5\nType: Fire\nDescription: When it swings its burning tail, it elevates the temperature to unbearably high levels.")
    end
    it 'returns both types if certain pokemon has two' do
      expect(processor.find_pkmn(1)).to eql("https://pokeres.bastionbot.org/images/pokemon/2.png\nName: Ivysaur\nNumber: 2\nType: Grass, Poison\nDescription: When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs.")
    end
    # rubocop:enable Layout/LineLength
  end
end
