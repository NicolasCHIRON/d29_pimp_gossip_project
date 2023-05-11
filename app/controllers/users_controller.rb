class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    puts params
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], email: params[:email], age: params[:age], city_id: City.all.sample.id, password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      flash[:notice] = 'Votre compte a bien été créé, bienvenue !'
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages[0]
      render 'new'
    end
  end

  def show
    @user = User.find(params['id'])
  end
  
end