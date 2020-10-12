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
    description = Reader.new.description_data(index + 1)['flavor_text_entries'][0]['flavor_text']
      .gsub("\n", ' ').gsub("\f", ' ')
    "#{image}\nName: #{name}\nNumber: #{number}\nType: #{type_one}#{type_two}\nDescription: #{description}"
  end
end
