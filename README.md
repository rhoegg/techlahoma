# techlahoma

[![Build Status](https://travis-ci.org/techlahoma/techlahoma.png?branch=master)](https://travis-ci.org/techlahoma/techlahoma)
[![Code Climate](https://codeclimate.com/repos/52f48b37695680575a0062d4/badges/740ac521c17011d57196/gpa.png)](https://codeclimate.com/repos/52f48b37695680575a0062d4/feed)
[![Coverage Status](https://coveralls.io/repos/techlahoma/techlahoma/badge.png)](https://coveralls.io/r/techlahoma/techlahoma)
[![Dependency Status](https://gemnasium.com/techlahoma/techlahoma.png)](https://gemnasium.com/techlahoma/techlahoma)


getting started
==========

## Prerequisites

You will need the following things properly installed on your computer.

* ruby - See the Gemfile for the current version required by this project.
* postgres


## Rails setup
```
> git clone https://github.com/techlahoma/techlahoma.git
> cd techlahoma
> bundle install
```

## Database setup

Make sure that postgress is running locally and then run:

```
> rake db:create
> rake db:migrate
> rake db:test:prepare
```

## Configuration

This app relies on several environment variables being set. You should copy the
`dotenv.sample.env` file to `.env` and update the values there as
needed. The default values should get you going with a complete local
setup.

If you're working directly with one of the integrated services
(GitHub, Twitter, etc...) you'll want to create your own development
account there in order to see exactly what's happening. If you do that
make sure to update your `.env` file accordingly. (Don't forget to also
update `.env` in the related projects!)

## Auth Configuration

Go to GitHub or Twitter and create a new app. The callback URL should be

http://localhost:5000/auth/github/callback

or

http://localhost:5000/auth/twitter/callback

Change the port if you plan to run this app on a different port.

After creating the app copy the Application ID and Secret into your `.env` file.

**Need more/better info here**

## Running unit tests

```
> rspect
```

## Running integration tests

```
> cucumber
```

## Feature files

The `features` dir contains Cucumber feature files that describe high level features.  New featues
should usually start as a new feature file with only a `Feature` section, then some discussion
should take place to reach agreement about exactly what the new feature is.  `Scenario` sections should
be written for each use case or edge case that can be identified.  Finally code should be written to
make each scenario pass.

## Starting the rails server

```
> foreman start
```

## Running a rails console

```
> rails c
```

## Deployment

Deployment happens automatically through [WE_NEED_A_CI_SERVICE]. Any pushes to `master` will be deployed. **This isn't actually true yet.**
This is deployed on heroku, and currently is deployed through direct pushing.


## Contributing

Please do!  We love pull requests.

