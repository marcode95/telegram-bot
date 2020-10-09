require 'telegram/bot'
require 'net/http'
require 'json'
#require_relative 'bot.rb'

class Motivate
  @results = nil

  def initialize
    @results = get_overall_data
  end

  def get_overall_data
    url = 'https://pokeapi.co/api/v2/pokemon?limit=151%27'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end

  def get_certain_data(pokemon_index)
    url = "https://pokeapi.co/api/v2/pokemon/#{pokemon_index}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end

  def random_pokemon
    @results["results"][rand(150)]["name"]
  end
end

puts bla = Motivate.new.get_certain_data(1)["types"][0]["type"]["name"]
puts bla = Motivate.new.get_certain_data(1)["types"][1]["type"]["name"]


# h = {"count"=>1050, 
#      "next"=>"https://pokeapi.co/api/v2/pokemon?offset=151&limit=151", 
#      "previous"=>nil, 
#      "results"=>
#      [{"name"=>"bulbasaur", "url"=>"https://pokeapi.co/api/v2/pokemon/1/"}, 
#       {"name"=>"ivysaur", "url"=>"https://pokeapi.co/api/v2/pokemon/2/"},     
#       {"name"=>"venusaur", "url"=>"https://pokeapi.co/api/v2/pokemon/3/"}]}

# puts h["results"][rand(150)]["name"]
