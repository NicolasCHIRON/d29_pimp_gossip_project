module GossipLikesHelper
  
  def already_exist?(gossip)
    GossipLike.where(user: current_user,gossip_id:gossip.id).length > 0
  end
  
end
