require_relative 'reader.rb'

class Processor
  def find_pkmn(index = rand(150))
    image = "https://pokeres.bastionbot.org/images/pokemon/#{index + 1}.png"
    name = Reader.new.all_pkmn_data['results'][index]['name'].capitalize
    number = index + 1
    types = Reader.new.one_pkmn_data(index + 1)['types']
    type_one = types[0]['type']['name'].capitalize
    type_two = nil
    type_two = ", #{types[1]['type']['name'].capitalize}" if types.length == 2
    descriptions = Reader.new.description_data(index + 1)
    for i in 0..4 do
      if descriptions['flavor_text_entries'][i]['language']['name'] == 'en'
        description = descriptions['flavor_text_entries'][i]['flavor_text'].gsub("\n", ' ').gsub("\f", ' ')
        break
      end
    end
    "#{image}\nName: #{name}\nNumber: #{number}\nType: #{type_one}#{type_two}\nDescription: #{description}"
  end
end
