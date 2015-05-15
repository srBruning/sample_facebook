# TESTING integration with Facebook.
# This is an example
# May 13, 2015
class GetServerTokenJob < ActiveJob::Base
	include Sidekiq::Worker

	def perform(user_id)
		puts "---- GetServerTokenJob  ----" 
		authorizations = Authorization.where(:user_id => user_id)
		authorizations.each do |aut|
			mToken =aut.token
			urlApi="https://graph.facebook.com/oauth/access_token?grant_type=fb_exchange_token&client_id=#{ENV['FACEBOOK_KEY']}&client_secret=#{ENV['FACEBOOK_SECRET']}&fb_exchange_token=#{mToken}"
			puts ENV['FACEBOOK_KEY']
			puts mToken
			a = RestClient.get  urlApi, {:accept => :json}
			puts a
			# I'm not doing as best here
			aut.server_token = a.sub('access_token=', "")
			aut.save
		end
	rescue  
    	puts '** Ocoreu um erro **' 
	end
 end	
