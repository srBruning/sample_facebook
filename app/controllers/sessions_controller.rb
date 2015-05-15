# TESTING integration with Facebook.
# This is an example
# May 13, 2015

require 'rubygems'
require 'json'
class SessionsController < ApplicationController

	def new
	end

	def create
		auth_hash = request.env['omniauth.auth']
		# binding.pry
		@authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
		if @authorization
			puts "-+-+-+--+- authorization +-+-+-+-++"
			render :text => "Welcome back #{@authorization.user.name}! You have already signed up."
			GetServerTokenJob.perform_async(@authorization.user.id )
		else
			hUserInfo = auth_hash["info"];
			user = User.new :name => hUserInfo["name"], :email =>hUserInfo["email"]
			user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"], :token => auth_hash["credentials"]["token"]
			user.save
			render :text => "Hi #{user.name}! You've signed up."
			GetServerTokenJob.perform_async(user.id)
		end
	end

	def failure
		render :text => "Sorry, but you didn't allow access to our app!"
	end

  	def destroy
	  session[:user_id] = nil
	  render :text => "You've logged out!"
	end
end
