# EVANU

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run

## Development
Recreate bin folder 
```rake rails:update:bin```

Reset Database
`bundle exec rake db:migrate:reset`

Reseed Database
`bundle exec rake db:seed`

## Production

Before running in production, check database status. For initialise the database in production use the following command:
```heroku run rake db:migrate```

Logs in Heroku can be obtained by:
```heroku logs -t```

