require_relative 'reader.rb'

class Processor 


  def random_pkmn
    random_index = rand(150)
    name = Reader.new.all_pkmn_data["results"][random_index]["name"]
    type = Reader.new.one_pkmn_data(random_index+1)["types"][0]["type"]["name"]
    description = Reader.new.description_data(random_index+1)["flavor_text_entries"][0]["flavor_text"]
    image = "https://pokeres.bastionbot.org/images/pokemon/#{random_index+1}.png"
    return name, random_index+1, type, description.gsub("\n", ' ').gsub("\f", ' '), image
  end
end


