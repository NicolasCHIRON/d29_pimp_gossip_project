class GossipLikesController < ApplicationController
  before_action :authenticate_user, only: [:create, :destroy]

  def create
    @like = GossipLike.new(user_id: current_user.id, gossip_id: params[:gossip_id])
    if (@like.save)
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy

  end

  private

  def authenticate_user
    unless current_user
      flash[:alert] = "Merci de vous connecter pour pouvoir mettre des likes."
      redirect_to new_session_path
    end
  end

end