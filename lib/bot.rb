require 'telegram/bot'
require_relative 'reader.rb'
require_relative 'searcher.rb'
require_relative 'processor.rb'
require_relative '../config.rb'
require_relative 'commands.rb'

class Bot
  def initialize
    token = Token.new.token

    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        Commands.new(bot, message).check
      end
    end
  end
end
