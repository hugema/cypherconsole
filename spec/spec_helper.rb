PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
require 'capybara/rspec'
require 'capybara/padrino/rspec'
require 'headless'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include Capybara::DSL

  headless = Headless.new
  headless.start
  at_exit{ headless.destroy }
end

# You can use this method to custom specify a Rack app
# you want rack-test to invoke:
#
#   app Cypherconsole::App
#   app Cypherconsole::App.tap { |a| }
#   app(Cypherconsole::App) do
#     set :foo, :bar
#   end
#
def app(app = nil, &blk)
  @app ||= block_given? ? app.instance_eval(&blk) : app
  @app ||= Padrino.application
end
