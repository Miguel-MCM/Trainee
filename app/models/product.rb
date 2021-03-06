class Product < ApplicationRecord
  belongs_to :category

  validates :name, :description, :price, presence: true

  has_many_attached :documentations
end
