#Cars API

## Requirements
* Ruby ``2.2.3``
* Postgresql
* Postgis

## Getting Started
* ``$ bundle install``
* ``$ rake db:setup`` # Note: this command will run create, schema_load, seed

Now you are all set to run the application by doing:

*  ``$ rackup``

## Useful Tasks

If in any case you need to reset the database you can do it by simply: `` $ rake db:reset `` this will drop the database, re created again and finally seed the DB.

## Running Tests

You can do it using Rake by:
* ``$ rake``

Or using bundler by:
* ``$ bundle exec rspec``