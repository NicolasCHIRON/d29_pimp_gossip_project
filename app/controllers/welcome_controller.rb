class WelcomeController < ApplicationController
  def welcome
    puts "$" * 60
    puts params
    puts "$" * 60
  end
end
