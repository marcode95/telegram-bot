require 'telegram/bot'
require_relative 'reader.rb'
require_relative 'searcher.rb'
require_relative 'processor.rb'

class Bot
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/PerceivedComplexity
  # rubocop:disable Metrics/BlockLength
  def initialize
    token = '1323012288:AAHdyNpbujJHOjofvm1dCBwOVw2-w4vLAvc'

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
                              text: 'If you want information about a random Pokemon use /random! If you want
                                    information about a specific Pokemon like f.e. Pikachu use /poke_pikachu!')

        elsif message.text == '/random'
          random_pkmn = Processor.new.find_pkmn
          bot.api.sendChatAction(chat_id: message.chat.id, action: 'upload_photo', date: message.date)
          bot.api.sendPhoto(chat_id: message.chat.id, photo: random_pkmn.split('Name:').first.to_s, date: message.date)
          bot.api.sendMessage(chat_id: message.chat.id, text: random_pkmn.split('png').last.to_s, date: message.date)

        elsif message.text.include?('/poke_')
          pkmn_index = Searcher.new.find_index(message.text)

          if pkmn_index != (0..150)
            certain_pkmn = Processor.new.find_pkmn(pkmn_index - 1)
            bot.api.sendChatAction(chat_id: message.chat.id, action: 'upload_photo', date: message.date)
            bot.api.send_photo(chat_id: message.chat.id,
                               photo: certain_pkmn.split('Name:').first.to_s,
                               date: message.date)
            bot.api.sendMessage(chat_id: message.chat.id, text: certain_pkmn.split('png').last.to_s, date: message.date)
          else
            bot.api.sendMessage(chat_id: message.chat.id,
                                text: "Hm.. I can't recall a first generation Pokemon with that name. Are you
                                      sure it's on this list?
                                      https://en.wikipedia.org/wiki/List_of_generation_I_Pok%C3%A9mon",
                                date: message.date)
          end

        else bot.api.sendMessage(chat_id: message.chat.id,
                                 text: "Invalid entry, #{message.from.first_name},
                                       you need to use  /start,  /stop or /motivate")
        end
      end
    end
  end
  # rubocop:enable Metrics/BlockLength
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/PerceivedComplexity
end
