require 'telegram/bot'
require_relative 'reader.rb'
require_relative 'processor.rb'


class Bot
  def initialize
    token = '1323012288:AAHdyNpbujJHOjofvm1dCBwOVw2-w4vLAvc'

  Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |message|
      case message.text
      when '/start'

        bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name} , welcome back! I hope your adventures are going well! Use  /start to start the bot,  /stop to end the bot or /random to get information about a random pokemon!")

      when '/stop'

        bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}", date: message.date)

      when '/random'

        bot.api.send_message(chat_id: message.chat.id, text: "#{Processor.new.random_pkmn}", date: message.date)
      else bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, #{message.from.first_name}, you need to use  /start,  /stop or /motivate")
      end
    end
  end
  end
end