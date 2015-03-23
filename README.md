# techlahoma

[![Build Status](https://travis-ci.org/techlahoma/techlahoma.png?branch=master)](https://travis-ci.org/techlahoma/techlahoma)
[![Code Climate](https://codeclimate.com/repos/52f48b37695680575a0062d4/badges/740ac521c17011d57196/gpa.png)](https://codeclimate.com/repos/52f48b37695680575a0062d4/feed)
[![Coverage Status](https://coveralls.io/repos/techlahoma/techlahoma/badge.png)](https://coveralls.io/r/techlahoma/techlahoma)
[![Dependency Status](https://gemnasium.com/techlahoma/techlahoma.png)](https://gemnasium.com/techlahoma/techlahoma)


## Feature files

The `features` dir contains Cucumber feature files that describe high level features.  New featues
should usually start as a new feature file with only a `Feature` section, then some discussion
should take place to reach agreement about exactly what the new feature is.  `Scenario` sections should
be written for each use case or edge case that can be identified.  Finally code should be written to
make each scenario pass.

## Contributing

Please do!  We love pull requests.

## Misc

* Ruby version - 2.2.1
* System dependencies - Postgres
* Configuration
* Database creation - `rake db:create`
* Database initialization - `rake db:schema:load`
* How to run the test suite - `cucumber`
  * Before running tests for first time - `rake db:test:prepare`
* Services - none
* Deployment instructions - TBD
* ...
* ???
* profit
