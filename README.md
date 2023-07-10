# Moon API

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