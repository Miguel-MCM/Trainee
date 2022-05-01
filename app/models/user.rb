class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name ,presence: :true
  acts_as_token_authenticatable

  has_many :favorites, dependent: :destroy
  has_many :products, through: :favorites

  has_one_attached :photo
end
