require 'open-uri'
require 'nokogiri'
require 'redis'
require 'sinatra'
require 'sinatra/reloader'

if ENV["REDISTOGO_URL"] != nil
  uri = URI.parse(ENV["REDISTOGO_URL"])
  redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
else
  redis = Redis.new
end

if redis.llen('homo') == 0 then
  doc = Nokogiri::HTML(open('http://www.hottomotto.com/menu_list/index/13'))
  
  doc.css('div#obento div.txt > h3').each_with_index do |node, i|
    puts i, node.text
    redis.rpush 'homo', node.text
  end
end

get '/' do
  @menu = redis.lrange 'homo', 0, 100
  erb :index
end
