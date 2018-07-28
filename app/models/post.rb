class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
    validates :body, presence: true
    validates :title, :uniqueness => { :message => "El titulo de esto post ya ha sido tomado" }
    resourcify

    extend FriendlyId 
    friendly_id :title, use: [:slugged, :finders]

    def should_generate_new_friendly_id?
        title_changed?
    end
end
