# Telebot Version 1.0.2

Telegram url: [Telebot](https://t.me/ivanmartovytskyi_telebot).

## Installation  

Create your bot in telegram [BotFather](https://t.me/BotFather) service.

Add Telegram bot API token to env var:

> Windows:
>> setx TELE_TOKEN "<your_api_key>"

> Linux:
>> export TELE_TOKEN=<your_api_key>  

Install import packages:
> go get  

Check format:
> gofmt -s -w ./  

Build app with version:
> go build -ldflags "-X 'github.com/ivanmartovytskyi/telebot/cmd.appVersion=v1.0.2'"

## Usage

Run bot:

> Windows:
>> telebot.exe start

> Linux:
>> telebot start  

Type following command in telegram telebot:
> /start hello
