require 'bundler/setup'
require 'database_cleaner'
require 'minitest'
require 'minitest/autorun'
require 'minitest/spec'

require 'mongoid'
require 'mongoid_sorted_relations'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

Mongoid.logger.level = Logger::INFO
Mongo::Logger.logger.level = Logger::INFO

Mongoid.configure do |config|
  config.connect_to('mongoid_sorted_relations')
end

DatabaseCleaner.orm = :mongoid
DatabaseCleaner.strategy = :truncation

class MiniTest::Spec
  before(:each) { DatabaseCleaner.start }
  after(:each) { DatabaseCleaner.clean }
end
