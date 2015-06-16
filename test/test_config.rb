RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
require 'mocha/api'Dir[File.expand_path(File.dirname(__FILE__) + "/../app/helpers/**/*.rb")].each(&method(:require))

# Specify your app using the #app helper inside a context.
# Takes either an app class or a block argument.
  include Mocha::API
# app { Padrino.application }
# app { Estibador::App.tap { |app| } }

class Riot::Situation
  include Mocha::API
  include Rack::Test::Methods

  # You can use this method to custom specify a Rack app
  # you want rack-test to invoke:
  #
  #   app Estibador::App
  #   app Estibador::App.tap { |a| }
  #   app(Estibador::App) do
  #     set :foo, :bar
  #   end
  #
  def app(app = nil, &blk)
    @app ||= block_given? ? app.instance_eval(&blk) : app
    @app ||= Padrino.application
  end
end

class Riot::Context
  include Mocha::API
end

