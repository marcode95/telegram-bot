require_relative '../lib/searcher.rb'

describe Searcher do
  let(:testone) { Searcher.new('/poke_bulbasaur') }
  let(:testtwo) { Searcher.new('/poke_mew') }
  let(:testthree) { Searcher.new('/poke_notapokemon') }

  describe '#find_index' do
    it 'takes substring of pokemons name and returns index' do
      expect(testone.find_index).to eql(1)
    end
    it 'takes substring of pokemons name and returns index' do
      expect(testtwo.find_index).to eql(151)
    end
    it 'does not return an integer if pokemon name is not existent' do
      expect(testthree.find_index).not_to eql(Integer)
    end
  end
end
