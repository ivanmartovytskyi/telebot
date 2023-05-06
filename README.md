# Telebot Version 1.0.2

Telegram url: [Telebot](https://t.me/ivanmartovytskyi_telebot).

<br>

## Installation  
<br>

Create your bot in telegram [BotFather](https://t.me/BotFather) service.
<br>

Add Telegram bot API token to env var:

> Windows:
>> setx TELE_TOKEN "<your_api_key>"

> Linux:
>> export TELE_TOKEN=<your_api_key>  
<br>

Install import packages:
> go get  

<br>

Check format:
> gofmt -s -w ./  

<br>

Build app with version:
> go build -ldflags "-X 'github.com/ivanmartovytskyi/telebot/cmd.appVersion=v1.0.2'"

<br>

## Usage
<br>

Run bot:

> Windows:
>> telebot.exe start

> Linux:
>> telebot start  

<br>

Type following command in telegram telebot:
> /start hello
