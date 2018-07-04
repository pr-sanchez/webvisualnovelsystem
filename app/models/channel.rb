class Channel < ActiveRecord::Base
    belongs_to :user
    has_many :discussions, dependent: :destroy
    has_many :users, through: :discussions
    resourcify

end