require_relative 'reader.rb'

class Processor 


  def find_pkmn(index=rand(150))
    name = Reader.new.all_pkmn_data["results"][index]["name"]
    type = Reader.new.one_pkmn_data(index+1)["types"][0]["type"]["name"]
      if Reader.new.one_pkmn_data(index+1)["types"].length == 2
        type_2 = Reader.new.one_pkmn_data(index+1)["types"][1]["type"]["name"]
      end
    description = Reader.new.description_data(index+1)["flavor_text_entries"][0]["flavor_text"]
    image = "https://pokeres.bastionbot.org/images/pokemon/#{index+1}.png"
    return name, index+1, type, type_2, description.gsub("\n", ' ').gsub("\f", ' '), image
  end
end
