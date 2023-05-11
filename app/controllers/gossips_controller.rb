class GossipsController < ApplicationController
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
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: User.all.sample.id)
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
end