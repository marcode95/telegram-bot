require 'telegram/bot'
require 'net/http'
require 'json'
#require_relative 'bot.rb'

class Motivate
  @results = nil

  def initialize
    @results = make_the_request
  end

  def make_the_request
    url = 'https://pokeapi.co/api/v2/pokemon?limit=151%27'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end

  def random_pokemon
    @results["results"][rand(150)]["name"]
  end

  # def select_random
  #   @values = @values.sample
  #   @values
  # end
end

#puts bla = Motivate.new.random_pokemon


# h = {"count"=>1050, 
#      "next"=>"https://pokeapi.co/api/v2/pokemon?offset=151&limit=151", 
#      "previous"=>nil, 
#      "results"=>
#      [{"name"=>"bulbasaur", "url"=>"https://pokeapi.co/api/v2/pokemon/1/"}, 
#       {"name"=>"ivysaur", "url"=>"https://pokeapi.co/api/v2/pokemon/2/"},     
#       {"name"=>"venusaur", "url"=>"https://pokeapi.co/api/v2/pokemon/3/"}]}

# puts h["results"][rand(150)]["name"]
