class LikesController < ApplicationController
  before_action :find_gossip
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
        flash[:notice] = "Tu ne peux pas like plus d'une fois voyons"
    else
      @gossip.likes.create(user_id: current_user.id)
    end
    redirect_to gossip_path(@gossip)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Tu ne peux pas unlike"
    else
      @like.destroy
    end
    redirect_to gossip_path(@gossip)
  end

  def find_like
    @like = @gossip.likes.find(params[:id])
  end
  
  private

  def find_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, gossip_id:
    params[:gossip_id]).exists?
  end
end
