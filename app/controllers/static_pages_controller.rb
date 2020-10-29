class StaticPagesController < ApplicationController
  def team
  end

  def contact
  end

  def index
    @gossip_array = Gossip.all
  end
end
