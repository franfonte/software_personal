# config/initializers/_coverage_rspec.rb

if Rails.env.test?
  require 'simplecov'
    SimpleCov.start 'rails'
end