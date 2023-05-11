class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show]
  before_action :authenticate_author, only: [:edit, :update, :destroy]

  def index
    return @params = Gossip.all
  end

  def show
    @gossip = Gossip.find(params['id'])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: current_user.id)
    if @gossip.save
      flash[:notice] = 'Le gossip a bien été créé'
      redirect_to '/'
    else
      flash[:alert] = @gossip.errors.full_messages[0]
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params['id'])
  end

  def update
    @gossip = Gossip.find(params['id'])
    if @gossip.update(params.require(:gossip).permit(:title, :content))
      flash[:notice] = 'Le gossip a bien été mis à jour'
      redirect_to @gossip
    else
      flash[:alert] = @gossip.errors.full_messages[0]
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params['id'])
    @gossip.destroy
    flash[:notice] = 'Le gossip a bien été supprimé !'
    redirect_to root_path
  end

  private

  def authenticate_user
    unless current_user
      flash[:alert] = "Merci de vous connecter pour voir les potins ou en créer un nouveau."
      redirect_to new_session_path
    end
  end

  def authenticate_author
    unless current_user == Gossip.find(params[:id]).user
      flash[:alert] = "Vous ne pouvez pas modifier ou supprimer un potin créé par un nouvel utilisateur"
      redirect_to root_path
    end
  end
end