# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 2.6.3

* System dependencies

    Some gems:
    pg for databases
    puma for web server
    rails-i18n for localization

* Configuration

    database.yml:
      for configuring databases for each environments. Postgres is used

    development.rb, production.rb, test.rb:
      for configuring mailer settings (smtp configuration)

* Database creation
  
  by running rails db:create and rails db:migrate

* Database initialization

  by editing database.yml

* How to run the test suite

  By running the command rails test <file_path>

* Services (job queues, cache servers, search engines, etc.)
  Configuration not needed for this project

* Deployment instructions
  git remote set heroku <path>
  git push heroku master

* ...
