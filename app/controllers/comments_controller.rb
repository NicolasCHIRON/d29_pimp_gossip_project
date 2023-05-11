class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def create
    @comment = Comment.create!(content: params[:content],gossip_id: params[:gossip_id] ,user_id: current_user.id)
    flash[:notice] = 'Le commentaire a bien été publié !'
    redirect_to gossip_path(params[:gossip_id])
  end

  def edit
    @comment = Comment.find(params['id'])
  end

  def update
    @comment = Comment.find(params['id'])
    @path = Gossip.find_by(id: @comment.gossip_id)
    if @comment.update(content: params['comment']['content'])
      flash[:notice] = 'Le commentaire a bien été mis à jour !'
      redirect_to @path
    else
      flash[:alert] = @comment.errors.full_messages[0]
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Le commentaire a bien été supprimé !'
    redirect_to gossip_path(@gossip)
  end

  private

  def authenticate_user
    unless current_user
      flash[:alert] = "Merci de vous connecter pour créer un nouveau commentaire."
      redirect_to new_session_path
    end
  end
end
