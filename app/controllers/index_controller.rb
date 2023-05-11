class IndexController < ApplicationController
  def home
    return @params = Gossip.all
  end
end
