class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  extend FriendlyId 
  friendly_id :comment, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
      comment_changed?
  end
end
