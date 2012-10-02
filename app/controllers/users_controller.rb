class UsersController < ApplicationController

  def show
    @user = User.find(params[:id]) # find Users from id given by params
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # handle successful save
      sign_in @user # signin upon signup
      flash[:success] = "Welcome to ToiletMaster! Enjoy toilets!"
      redirect_to root_path
    else
      render 'new'
    end
  end
end
