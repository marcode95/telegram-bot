require 'telegram/bot'
require 'net/http'
require 'json'
#require_relative 'bot.rb'

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
end

#puts bla = Reader.new.one_pkmn_data(1)

# puts bla = Motivate.new.one_pkmn_data(1)["types"][0]["type"]["name"]
# puts bla = Motivate.new.one_pkmn_data(1)["types"][1]["type"]["name"]


# h = {"count"=>1050, 
#      "next"=>"https://pokeapi.co/api/v2/pokemon?offset=151&limit=151", 
#      "previous"=>nil, 
#      "results"=>
#      [{"name"=>"bulbasaur", "url"=>"https://pokeapi.co/api/v2/pokemon/1/"}, 
#       {"name"=>"ivysaur", "url"=>"https://pokeapi.co/api/v2/pokemon/2/"},     
#       {"name"=>"venusaur", "url"=>"https://pokeapi.co/api/v2/pokemon/3/"}]}

# puts h["results"][rand(150)]["name"]
