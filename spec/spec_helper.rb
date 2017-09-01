require 'bundler/setup'
require 'active_record'
require 'active_record/quick_clone'
require 'support/schema'
require 'support/models'
require 'pry'


RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
