require_relative '../lib/searcher.rb'

describe Searcher do
  let(:searcher) { Searcher.new }

  describe '#find_index' do
    it 'takes substring of pokemons name and returns index' do
      expect(searcher.find_index('/poke_bulbasaur')).to eql(1)
    end
  end
  describe '#find_index' do
    it 'takes substring of pokemons name and returns index' do
      expect(searcher.find_index('/poke_pikachu')).to eql(25)
    end
  end
  describe '#find_index' do
    it 'takes substring of pokemons name and returns index' do
      expect(searcher.find_index('/poke_mew')).to eql(151)
    end
  end
  describe '#find_index' do
    it 'does not return an integer if pokemon name is not existent' do
      expect(searcher.find_index('/poke_notapokemonname')).not_to eql(Integer)
    end
  end
end
