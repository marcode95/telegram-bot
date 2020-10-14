require_relative 'replies.rb'

class Commands
  include Replies

  attr_reader :message
  attr_reader :bot

  def initialize(bot, message)
    @bot = bot
    @message = message
  end

  def check
    if message.text == '/hey'
      hey_reply(bot, message)

    elsif message.text == '/bye'
      bye_reply(bot, message)

    elsif message.text == '/info'
      info_reply(bot, message)

    elsif message.text == '/random'
      random_reply(bot, message)

    elsif message.text.include?('/poke_')
      certain_reply(bot, message)

    else
      failed_reply(bot, message)
    end
  end
end
