require 'rubygems'
require 'sinatra'
require 'json'

set :port, 9999

post '/ip/add' do
  ip_list = load_list
  addresses = JSON.parse(request.body.read)

  addresses.each { |address| ip_list << address unless ip_list.include?(address) }

  save_list(ip_list)

  "List saved!"
end

get '/ip/get/:ip_address' do
  ip_list = load_list

  if ip_list.include?(params[:ip_address])
    "#{params[:ip_address]}"
  else
    status 500
  end
end

get '/ip/all' do
  ip_list = load_list
  
  content_type :json
  ip_list.to_json
end

delete '/ip/all' do
  ip_list = []
  save_list(ip_list)

  "Deleted!"
end

def load_list
  ip_list = File.open("list.txt", "r").read.split(',')
end

def save_list(ip_list)
  file = File.open("list.txt","w")
  file.print ip_list.join(",")
  file.close
end