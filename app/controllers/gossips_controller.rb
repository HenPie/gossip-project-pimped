class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]

  def index

  end

  def show
    @gossip = Gossip.find(params[:id])
    @user = User.find(@gossip.user_id)
    @comments = Comment.where(gossip_id: params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new('title' => params[:title], 'content' => params[:content], 'user' => User.all.sample)
    @gossip.user = current_user
    if @gossip.save 
      redirect_to root_path, flash: {success: "Gossip cree avec success" }
    else
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to root_path
    else 
      render :edit 
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end

  private 

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
