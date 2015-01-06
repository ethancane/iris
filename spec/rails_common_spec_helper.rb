require 'active_record'
require 'shoulda/matchers'

RSpec.configure do |config|
  config.around do |example|
    ActiveRecord::Base.transaction do
      example.run
      fail ActiveRecord::Rollback
    end
  end

  require 'factory_girl_rails'
  config.include(FactoryGirl::Syntax::Methods)
end

# Checks for pending migrations before tests are run.
ActiveRecord::Migration.maintain_test_schema!