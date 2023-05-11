class Comment < ApplicationRecord
  validates :content, presence: true
  has_many :comment_likes
  belongs_to :user
  belongs_to :gossip
  belongs_to :parent_comment, class_name: 'Comment', optional: true
  has_many :child_comments, class_name: 'Comment', foreign_key: :parent_comment_id, dependent: :destroy
end
