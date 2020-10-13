# Telegram Bot - Pokemon API

![Demo](https://www.pokewiki.de/images/thumb/6/6c/Sugimori_025.png/250px-Sugimori_025.png)

Ruby implementation of a Telegram Bot giving out information about the first 151 characters of the famous Pokemon franchise using https://pokeapi.co/ 

> This project was developed as a learning project part of the Microverse curriculum.

![Demo](https://media.giphy.com/media/qP7w0NhZvs62YUtpdC/giphy.gif)

## Built With

- Ruby

## Getting Started

**Step 1**<br>
Clone the repo to a local folder by inputting this command into your terminal<br>
`git clone https://github.com/marcode95/telegram-bot`<br>
and switch to the feature branch with this one<br>
`git checkout feature`<br>
**Step 2**<br>
Run `cd telegram-bot`<br>
**Step 3**<br>
Run `bundle install` to install the gems from the `Gemfile`.<br>
**Step 4**<br>
Download the [Telegram app](https://desktop.telegram.org/), create an account, search for a new contact named [Botfather](https://t.me/botfather).<br>
**Step 5**<br>
Press /start to start the conversation and /newbot to create a new bot (just follow the instructions). You will then receive an API Token that looks like this: 1347431199:AAH4hPt6PDiJB4swk23Lb4oOzwocjKpba0S4<br>
**Step 6**<br>
Go to lib/bot.rb, put your token into quotation marks to turn it into a string and replace Token.new.token in line 14 with it. Line 14 should look something like this afterwards:  token = '1347431199:AAH4hPt6PDiJB4swk23Lb4oOzwocjKpba0S4'<br>
**Step 7**<br>
Delete line 5 "require_relative '../config.rb'<br>
**Step 8**<br>
Run `ruby ./bin/main.rb` to start the bot.<br>
**Step 9**<br>
After creating your bot in telegram Botfather should have provided you with a link to access it. Press it.<br>
**Step 10**<br>
Type /hey to start and enjoy!

## Commands

- /hey will start the bot
- /info will give you information about the abilities of the bot
- /random will give out information about a random pokemon
- /poke_nameofpokemon will give out information about a certain Pokemon of the first generation: https://en.wikipedia.org/wiki/List_of_generation_I_Pok%C3%A9mon
- /bye will end the bot

## Prerequisites

Ruby installed locally

## Testing

To test this code download RSpec, access the repository using the terminal, write rspec and execute.

## Authors

👤 **Marco Erhardt**

- Github: [@marcode95](https://github.com/marcode95)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse for showing the way for this project to happen
- Contributors to PokeApi