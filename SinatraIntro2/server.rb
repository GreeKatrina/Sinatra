require 'sinatra'
require 'rspec'

set :bind, '0.0.0.0'

get '/welcome/:name' do
  erb :welcome
end

get '/say/*/to/*' do
  puts params
  erb :say
end

get '/form' do
	erb :forms
end

post '/form' do
	puts params
	@name = params[:name]
	@email = params[:mail]
	@vegetarian = params[:vegetarian]
	@blood_type = params[:bloodtype]
	erb :form
end

get '/dog-registration' do
	erb :dog
end

get '/dog-registration-results' do
	puts params
	@name = params[:name]
	@species = params[:species]
	@fixed = params[:fixed]
	@haircolor = params[:haircolor]
	erb :dogresults
end