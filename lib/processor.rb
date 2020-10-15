require_relative 'reader.rb'

class Processor
  attr_reader :index

  def initialize(index)
    @index = index
  end

  def image_link
    "https://pokeres.bastionbot.org/images/pokemon/#{index + 1}.png"
  end

  def name
    Reader.new.all_pkmn_data['results'][index]['name'].capitalize
  end

  def number
    index + 1
  end

  def types
    types = Reader.new.one_pkmn_data(index + 1)['types']
    type_one = types[0]['type']['name'].capitalize
    type_two = nil
    type_two = ", #{types[1]['type']['name'].capitalize}" if types.length == 2
    "#{type_one}#{type_two}"
  end

  def description
    descriptions = Reader.new.description_data(index + 1)
    (0..4).each do |i|
      if descriptions['flavor_text_entries'][i]['language']['name'] == 'en'
        descriptions = descriptions['flavor_text_entries'][i]['flavor_text'].gsub("\n", ' ').gsub("\f", ' ')
        break
      end
    end
    descriptions
  end
end
