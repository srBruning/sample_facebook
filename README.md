Example login and integration with facebook using Rails and gem [omniauth-facebook](https://github.com/mkdynamic/omniauth-facebook).
Background jobs are used to: generate the server tokem and to seek User data once per minute.
you will need:
  The first thing we need to do is set up a [Facebook application](http://developers.facebook.com/apps).
  Get the "app id" and save the environment variable		FACEBOOK_KEY  
  Get the "app secret" and save the environment variable	FACEBOOK_SECRET



* Ruby version
  ruby 2.2.0
* Dependencies
  Sidekiq
  Sidetiq
  Omniauth-facebook
  
* Running
  Sidekiq run in a terminal and another terminal run the server
  bundle exec sidekiq
  rails s


<tt>rake doc:app</tt>.
