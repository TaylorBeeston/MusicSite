ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Returns true if a user is logged in
  def logged_in?
    !session[:admin].nil?
  end

  # Logs in a given user
  def log_in_as(user)
    session[:admin] = user.id
  end

  CarrierWave.configure do |config|
    config.root = Rails.root.join("test/fixtures/files")
    config.cache_only = true
    config.enable_processing = false
    config.storage = :file
  end

  def after_teardown
    super
    CarrierWave.clean_cached_files!(0)
  end

end
