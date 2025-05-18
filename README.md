# Moon API

## Requests 

`GET /` [[run]](https://moon-api.co)

Returns the current moonphase

`GET /phases/[phase]` [[run]](https://moon-api.co/phases/new)

Possible phases: `new`, `waxing_crescent`, `first_quarter`, `waxing_gibbous`, `full`, `waning_gibbous`, `last_quarter`, `waning_crescent`

Returns the information for the specified phase

`GET /date/[unix timestamp]` [[run]](https://moon-api.co/date/1689859150)

Returns the phase for the given date

## Phase data shape

| field                | type             | description                                                                                 |
|----------------------|------------------|---------------------------------------------------------------------------------------------|
| phase                | string           | one of `new`, `waxing_crescent`, `first_quarter`, `waxing_gibbous`, `full`, `waning_gibbous`, `last_quarter`, `waning_crescent` |
| days                 | integer          | number of days in this moon phase - always 0 for date and phase endpoints                   |
| emoji                | emoji            | one of 🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘                                                                 |
| association          | string           | magical association for this phase                                                          |

`GET /phases` [[run]](https://moon-api.co/phases)

Returns an array of all the possible phases of the moon and associated data. 

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

Deploying is just merging now that I'm hosting on [Render](https://render.com/), worth it IMO to keep the APP patched and live without having to write my own deployment pipeline for a hobby app. 
