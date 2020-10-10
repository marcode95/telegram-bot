require_relative 'reader.rb'

class Processor 


  def random_pkmn
    random_index = rand(150)
    name = Reader.new.all_pkmn_data["results"][random_index]["name"]
    type = Reader.new.one_pkmn_data(random_index+1)["types"][0]["type"]["name"]
    return name, random_index+1, type
  end
end

puts test = Processor.new.random_pkmn
