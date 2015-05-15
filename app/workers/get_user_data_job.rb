# TESTING integration with Facebook.
# This is an example
# May 13, 2015

require 'rubygems'
require 'json'
class GetUserDataJob < ActiveJob::Base
  	include Sidekiq::Worker
  	include Sidetiq::Schedulable
  	
  	recurrence { minutely(1) }

	def perform()
	  puts "***-------- GetUserDataJob ---------****"
	  Authorization.all.each do |aut|
		unless aut.server_token.blank?
			# FACEBOOK_KEY is an environment variable 
		    url =  "https://graph.facebook.com/me?client_id=v{ENV['FACEBOOK_KEY']}&access_token=#{aut.server_token}"
		    b = RestClient.get  url
		    aut.user.facebook_data = b
		    fUser = JSON.parse(b)	
		    aut.user.name = fUser['first_name']
		    aut.user.email = fUser['email']
		    aut.save	    
	  		puts "***--- DATA USER ---****"
		    puts fUser['first_name']
		    puts fUser['email']
		    puts fUser['id']		  		
	  	end

	  end
	  puts "END -------- GetUserDataJob --------- END "
	end
end
