require 'telegram/bot'
require_relative 'reader.rb'
require_relative 'searcher.rb'
require_relative 'processor.rb'
require_relative '../config.rb'

class Bot
  # rubcop:disable Metrics/AbcSize
  # rubcop:disable Metrics/MethodLength
  # rubcop:disable Metrics/PerceivedComplexity
  # rubcop:disable Metrics/BlockLength
  # rubcop:disable Layout/LineLength
  # rubcop:disable Metrics/CyclomaticComplexity
  def initialize
    token = Token.new.token

    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        if message.text == '/hey'
          basic_keyboard = [[Telegram::Bot::Types::KeyboardButton.new(text: '/hey')],
                            [Telegram::Bot::Types::KeyboardButton.new(text: '/info')],
                            [Telegram::Bot::Types::KeyboardButton.new(text: '/random')],
                            [Telegram::Bot::Types::KeyboardButton.new(text: '/bye')]]

          bot.api.sendAnimation(chat_id: message.chat.id,
                                animation: 'https://media.giphy.com/media/whcXjQYrQWfF11l85q/giphy.gif',
                                reply_markup: Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: basic_keyboard))

        elsif message.text == '/bye'
          bot.api.sendAnimation(chat_id: message.chat.id,
                                animation: 'https://media.giphy.com/media/ALV6n8JJdFA7X9RayA/giphy.gif',
                                date: message.date)

        elsif message.text == '/info'
          bot.api.sendMessage(chat_id: message.chat.id,
                              text: 'If you want information about a random Pokemon use /random! If you want information about a specific Pokemon like f.e. Bulbasaur or Charmander use /poke_bulbasaur or /poke_charmander!')

        elsif message.text == '/random'
          random_pkmn = Processor.new(rand(0..150))
          bot.api.sendChatAction(chat_id: message.chat.id, action: 'typing', date: message.date)
          bot.api.sendPhoto(chat_id: message.chat.id, photo: random_pkmn.image_link, date: message.date)
          bot.api.sendMessage(chat_id: message.chat.id, text: "Name: #{random_pkmn.name}\nNumber: #{random_pkmn.number}\nType: #{random_pkmn.types}\nDescription: #{random_pkmn.description}", date: message.date)

        elsif message.text.include?('/poke_')
          pkmn_index = Searcher.new(message.text).find_index
          if pkmn_index.is_a?(Integer)
            certain_pkmn = Processor.new(pkmn_index - 1)
            bot.api.sendChatAction(chat_id: message.chat.id, action: 'typing', date: message.date)
            bot.api.sendPhoto(chat_id: message.chat.id, photo: certain_pkmn.image_link, date: message.date)
            bot.api.sendMessage(chat_id: message.chat.id, text: "Name: #{certain_pkmn.name}\nNumber: #{certain_pkmn.number}\nType: #{certain_pkmn.types}\nDescription: #{certain_pkmn.description}", date: message.date)
          else
            bot.api.sendMessage(chat_id: message.chat.id,
                                text: "Hm.. I can't recall a first generation Pokemon with that name. Are you sure it's on this list? https://en.wikipedia.org/wiki/List_of_generation_I_Pok%C3%A9mon",
                                date: message.date)
          end

        else bot.api.sendMessage(chat_id: message.chat.id,
                                 text: "Invalid entry, #{message.from.first_name},
                                       you need to use  /start,  /stop or /motivate")
        end
      end
    end
  end
  # rubcop:enable Metrics/CyclomaticComplexity
  # rubcop:enable Layout/LineLength
  # rubcop:enable Metrics/BlockLength
  # rubcop:enable Metrics/AbcSize
  # rubcop:enable Metrics/MethodLength
  # rubcop:enable Metrics/PerceivedComplexity
end
