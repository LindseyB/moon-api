# Moon API

## Requests 

`GET /` [[run]](http://moon-api.co)

Returns the current moonphase

`GET /phases/[phase]` [[run]](http://moon-api.co/phases/new)

Possible phases: `new`, `waxing_crescent`, `first_quarter`, `waxing_gibbous`, `full`, `waning_gibbous`, `last_quarter`, `waning_crescent`

Returns the information for the specified phase

`GET /date/[unix timestamp]` [[run]](http://moon-api.co/date/1689859150)

Returns the phase for the given date

## Phase data shape

| field                | type             | description                                                                                 |
|----------------------|------------------|---------------------------------------------------------------------------------------------|
| phase                | string           | one of `new`, `waxing_crescent`, `first_quarter`, `waxing_gibbous`, `full`, `waning_gibbous`, `last_quarter`, `waning_crescent` |
| days                 | integer          | number of days in this moon phase - always 0 for date and phase endpoints                   |
| emoji                | emoji            | one of 🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘                                                                 |
| association          | string           | magical association for this phase                                                          |


### Example payload

```json
{
  "phase": "waxing_crescent",
  "days": 2,
  "emoji": "🌒",
  "association": "setting intentions"
}
```


## Testing

  ```bash
  bundle exec rake test
  ```

## Getting Started

  ```bash
  bundle install
  bundle exec rackup
  ```

## Deploying

  ```bash
  gcloud config set project moon-api-392403  # set the correct project
  gcloud app deploy                          # deploy the app
  gcloud app logs tail -s default            # tail the logs to make sure things are gucci
  ```
