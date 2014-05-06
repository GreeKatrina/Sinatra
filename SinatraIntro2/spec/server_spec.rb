# spec/app_spec.rb
require './server.rb'
require 'server_spec_helper.rb'


describe "server" do
  it "should allow to access welcome page" do
    get '/welcome/:name'
    last_response.should be_ok
  end
end