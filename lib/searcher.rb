require_relative 'reader.rb'

class Searcher

  def find_index(pkmn_name)
    pkmn_name.slice!('/poke_')
    results = Reader.new.all_pkmn_data["results"]
    for i in 0..150 do
      return i + 1 if results[i]["name"] == pkmn_name
    end
  end
end
