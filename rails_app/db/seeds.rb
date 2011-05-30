# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Client.create(
  :name => "Sinatra Client",
  :redirect_uri => "http://localhost:9393/oauth/callback",
  :website => "http://localhost:9393/",
  :identifier => "120094574673767",
  :secret => "b54dc82476af2814e620b86776c42c0e"
)

User.create(
  :email => "alex@fuckingawesome.com",
  :password => "dragons",
  :name => "Alex"
)