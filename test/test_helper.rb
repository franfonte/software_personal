# frozen_string_literal: true
require 'simplecov'

SimpleCov.start 'rails'  do
  add_filter '/test/'      
end

'''do
  add_filter "/test/"
  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
end '''

# Inicializa el entorno de pruebas de Rails
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

# Configuración por defecto proporcionada por Rails
class ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers
  Warden.test_mode!
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end


