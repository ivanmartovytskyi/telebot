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

# Deploy

export TF_VAR_GITHUB_OWNER=`<your-github-login>`

export TF_VAR_GITHUB_TOKEN=`<your-github-token-with-repo-creation-rights>`

## Local test

Make sure terraform is installed on your system

Rename main.tf.local to main.tf

## Run 

> terraform init

> terraform apply

# Note
This project uses forks of terraform modules made by [Denys Vasyliev](https://github.com/den-vasyliev):

[tf-fluxcd-flux-bootstrap](https://github.com/den-vasyliev/tf-fluxcd-flux-bootstrap)

[tf-google-gke-cluster](https://github.com/den-vasyliev/tf-google-gke-cluster)

[tf-hashicorp-tls-keys](https://github.com/den-vasyliev/tf-hashicorp-tls-keys)

[tf-kind-cluster](https://github.com/den-vasyliev/tf-kind-cluster)

[tf-github-repository](https://github.com/den-vasyliev/tf-github-repository)
