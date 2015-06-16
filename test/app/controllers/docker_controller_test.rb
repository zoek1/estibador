require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

context "/docker" do
  context "description here" do
    setup do
      get "/docker"
    end

    asserts("the response body") { last_response.body }.equals "Hello World"
  end
end
