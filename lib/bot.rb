require 'telegram/bot'
require_relative 'reader.rb'
require_relative 'searcher.rb'
require_relative 'processor.rb'


class Bot
  def initialize
    token = '1323012288:AAHdyNpbujJHOjofvm1dCBwOVw2-w4vLAvc'

  Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |message|
      case
      when message.text == '/start'

        bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name} , welcome back! I hope your adventures are going well! Use  /hi if you want to chat,  /bye if you want to leave or /info to get information about pokemon!")

      when message.text == '/stop'

        bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}", date: message.date)

      when message.text == '/info'

        bot.api.send_message(chat_id: message.chat.id, text: "If you want information about a random Pokemon use /random! If you want information about a specific Pokemon like f.e. Pikachu use /poke_pikachu! If you want a list of all Pokemon of a specific type like f.e. water use /type_water!")

      when message.text == '/random'
      
        bot.api.send_message(chat_id: message.chat.id, text: "#{Processor.new.find_pkmn}", date: message.date)

      when message.text.include?('/poke_')
        pkmn_index = Searcher.new.find_index(message.text)
        
        if pkmn_index != (0..150) 
          bot.api.send_message(chat_id: message.chat.id, text: "#{Processor.new.find_pkmn(pkmn_index-1)}", date: message.date)
        else
          bot.api.send_message(chat_id: message.chat.id, text: "Hm.. I can't recall a first generation Pokemon with that name. Are you sure it's on this list? https://en.wikipedia.org/wiki/List_of_generation_I_Pok%C3%A9mon", date: message.date)
        end

      when message.text == '/type_'
        
        bot.api.send_message(chat_id: message.chat.id, text: "it's working", date: message.date)
      
      else bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, #{message.from.first_name}, you need to use  /start,  /stop or /motivate")
      end
    end
  end
  end
end