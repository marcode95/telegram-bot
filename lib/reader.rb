require 'telegram/bot'
require 'net/http'
require 'json'

class Reader
  def all_pkmn_data
    url = 'https://pokeapi.co/api/v2/pokemon?limit=151%27'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end

  def one_pkmn_data(pkmn_index)
    url = "https://pokeapi.co/api/v2/pokemon/#{pkmn_index}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end

  def description_data(pkmn_index)
    url = "https://pokeapi.co/api/v2/pokemon-species/#{pkmn_index}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end
end

test = Reader.new.description_data(25)
for i in 0..2 do
  if test['flavor_text_entries'][i]['language']['name'] == 'en'
    puts test['flavor_text_entries'][i]['flavor_text']
    break
  end
end