Example login and integration with facebook using Rails and gem [omniauth-facebook](https://github.com/mkdynamic/omniauth-facebook).
Background jobs are used to: generate the server tokem and to seek User data once per minute.
you will need:
  The first thing we need to do is set up a [Facebook application](http://developers.facebook.com/apps).
  Get the "app id" and save the environment variable		FACEBOOK_KEY  
  Get the "app secret" and save the environment variable	FACEBOOK_SECRET



<p>Ruby version
  <br/>ruby 2.2.0
</p>
<p>Dependencies
<br/>Sidekiq
<br/>Sidetiq
<br/>Omniauth-facebook
</p>
  
<p>Running
<br/>Sidekiq run in a terminal and another terminal run the server
<br/>bundle exec sidekiq
<br/>rails s
 </p>

