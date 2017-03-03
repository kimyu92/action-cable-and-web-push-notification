# README

An example Rails app, using Action Cable and Service Worker (Web Push Notification)

Live demo available: https://question-answer-nimbl3-growth.herokuapp.com/

## Technicals ##

- Action Cable
- Service Worker - Web push notification
- Firebase clound message

## Run it on local ##

### Step 1 ###

Create a new project on Firebase at https://console.firebase.google.com/

Get `Server key` and `Sender ID` for `Firebase cloud messaging` at https://console.firebase.google.com/project/qa-nimbl3-growth/settings/cloudmessaging


### Step 2 ###

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


### Step 3 ###

```
rake db:setup

```

### Step 4 ###

```
rails server
```
