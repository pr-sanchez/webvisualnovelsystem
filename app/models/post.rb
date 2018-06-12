class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
    validates :body, presence: true
    validates :title, :uniqueness => { :message => "El titulo de esto post ya ha sido tomado" }

end
