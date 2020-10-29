class UsersController < ApplicationController
  def welcome
    puts "$" * 60
    puts "Voici le first name utilisé :"
    puts  params[:first_name]
    puts "$" * 60
    @user = User.new
    @user.first_name = (params["first_name"])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @cities = City.all
    @user = User.new
  end

  def create 
    @cities = City.all
    @user = User.new('first_name' => params[:first_name],'last_name' => params[:last_name], 'description' => params[:description], 'email' => params[:email], 'age' => params[:age], 'city' => City.all.sample, 'password' => params[:password])
    if @user.save 
      session[:user_id] = user.id
      redirect_to root_path, flash: {success: "Utilisateur créé avec success" }
    else
      render 'new'
    end
  end

end
