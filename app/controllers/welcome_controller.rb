class WelcomeController < ApplicationController
  skip_before_filter :default_index
  def index
  end
end
