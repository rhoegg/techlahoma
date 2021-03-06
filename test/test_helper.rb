ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"


# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"
require 'minitest/unit'
require "minitest/autorun"

class ActiveSupport::TestCase
  fixtures :all

  def json(body)
	   JSON.parse(body, symbolize_names: true)
  end
end
