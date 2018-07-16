# Websocket and Web Push notification

An Rails example app using Action Cable and Service Worker (Web Push Notification)

Live demo available: https://question-answer-nimbl3-growth.herokuapp.com/

## Technicals ##

- Action Cable
- Service Worker - Web push notification
- Firebase clound message

## Usage

### Step 1

Create a new project on Firebase at https://console.firebase.google.com/

Get `Server key` and `Sender ID` for `Firebase cloud messaging` at https://console.firebase.google.com/project/qa-nimbl3-growth/settings/cloudmessaging

### Step 2

Clone the repository

`git clone git@github.com:nimbl3/action-cable-and-web-push-notification.git`

### Step 3

Edit file `public/manifest.json`, change `gcm_sender_id` to your `Sender ID` above


```
# public/manifest.json

{
  "gcm_sender_id": <YOUR_SENDER_ID>
}


```

Edit file `config/application.yml`

- Change `FIRE_BASE_API_KEY` to `your server key`
- Change `DB_HOST` to `your database host`
- Change `DB_PORT` to `your database port`
- Change `USERNAME` to `your database username`
- Change `FIRE_BASE_API_KEY` to `your server key`

```
# config/application.yml

development:
  DB_HOST: "192.168.99.100"
  DB_PORT: "5432"
  USERNAME: "postgres"
  FIRE_BASE_API_KEY: 'YOUR_SERVER_KEY'
```


### Step 4

```
rake db:setup
rails server

```

## License

This project is Copyright (c) 2014-2018 Nimbl3 Ltd. It is free software,
and may be redistributed under the terms specified in the [LICENSE] file.

[LICENSE]: /LICENSE

## About

![Nimbl3](https://dtvm7z6brak4y.cloudfront.net/logo/logo-repo-readme.jpg)

This project is maintained and funded by Nimbl3 Ltd.

We love open source and do our part in sharing our work with the community!
See [our other projects][community] or [hire our team][hire] to help build your product.

[community]: https://nimbl3.github.io/
[hire]: https://nimbl3.com/
