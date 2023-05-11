class SessionsController < ApplicationController
  def new

  end

  def create
    puts params
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Bienvenue parmi nous, #{@user.first_name}"
      redirect_to '/'
    else
      flash[:alert] = 'Erreur de saisie, veuillez recommencer'
      render 'new'
    end

  end

  def destroy
    session.delete(:user_id)
    redirect_to '/', notice: "Au revoir, et à bientôt !"
  end
end
