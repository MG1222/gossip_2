class UsersController < ApplicationController
 # before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @gossips = Gossip.all
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit

  end

  def create
     @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      city: City.last
    )
    if @user.save
      redirect_to users_path 
    else 
      logger.debug "User created:@user.inspect"
      puts "#{@user}"
      puts "#{@user.errors.inspect}"
      flash[:danger] = "Nop"   
      render new_user_path
    end
  end

  def update
   
  end


 
end
