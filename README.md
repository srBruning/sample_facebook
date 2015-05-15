<p>Example login and integration with facebook using Rails and gem <a href="https://github.com/mkdynamic/omniauth-facebook">omniauth-facebook</a>.</p>
<p>Background jobs are used to: <br/>generate the server tokem <br/>and to seek User data once per minute.</p>
<p>
you will need:
  <ul>
    <li>The first thing we need to do is set up a <a href="http://developers.facebook.com/apps">Facebook application</a>.</li>
    <li>Get the "app id" and save the environment variable		FACEBOOK_KEY</li>
    <li>Get the "app secret" and save the environment variable	FACEBOOK_SECRET</li>
    <li>Para rodar no localhost:3000 set o dominio do projeto como http://localhost:3000</li>
  </ul>
</p>

<h3>Ruby version</h3>
  <br/>ruby 2.2.0
<h3>Dependencies</h3>
<br/>Sidekiq
<br/>Sidetiq
<br/>Omniauth-facebook

<h3>Running</h3>
<br/>Sidekiq run in a terminal and another terminal run the server
<br/>bundle exec sidekiq
<br/>rails s


