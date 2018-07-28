class User < ActiveRecord::Base
    rolify
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
         
    has_many :posts
    has_many :comments
    has_many :discussions, dependent: :destroy
    has_many :channels, through: :discussions, dependent: :destroy
    has_many :characters
    validates_uniqueness_of :username
    validates_uniqueness_of :email
  
  end