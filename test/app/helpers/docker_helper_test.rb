require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

describe "Estibador::App::DockerHelper" do
  setup do
    helpers = Class.new
    helpers.extend Estibador::App::DockerHelper
    [helpers.foo]
  end

  asserts("#foo"){ topic.first }.nil
end
