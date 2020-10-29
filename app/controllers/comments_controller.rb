class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]

  def index
  end

  def show
   
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update('content' => params[:content])
      redirect_to root_path
    else 
      render :edit 
    end
  end

  def new
    @comment = Comment.new
    @gossip = Gossip.find(params[:gossip_id])
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new('content' => params[:content], 'gossip' => @gossip, 'user' => current_user)
    if @comment.save 
      redirect_to root_path, flash: {success: "Commentaire cree avec success" }
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
