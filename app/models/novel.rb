class Novel < ActiveRecord::Base
    belongs_to :user

    validates :title, presence: true, length: { minimum: 5 }
    validates :description, presence: true
    validates :title, :uniqueness => { :message => "El titulo de esta novalea ya ha sido tomado" }
    resourcify
end
