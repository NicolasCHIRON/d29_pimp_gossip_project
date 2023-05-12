class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      log_in(@user)
      remember(@user)
      flash[:notice] = "Bienvenue parmi nous, #{@user.first_name}"
      redirect_to '/'
    else
      flash[:alert] = 'Erreur de saisie, veuillez recommencer'
      render 'new'
    end

  end

  def destroy
    log_out(current_user)
    redirect_to '/', notice: "Au revoir, et à bientôt !"
  end
end
