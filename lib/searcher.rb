require_relative 'reader.rb'

class Searcher
  def initialize(pkmn_name)
    @pkmn_name = pkmn_name
  end

  def find_index
    @pkmn_name.slice!('/poke_')
    results = Reader.new.all_pkmn_data['results']
    index = nil
    (0..150).each do |i|
      index = i + 1 if results[i]['name'] == @pkmn_name
    end
    index
  end
end

p Searcher.new('/poke_pikachu').find_index
