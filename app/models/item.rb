class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :day
  belongs_to :prefecture

  validates :name,            presence: true
  validates :explain,         presence: true
  validates :category_id,     numericality: { other_than: 1 } 
  validates :condition_id,    presence: true
  validates :shipping_id,     presence: true
  validates :prefecture_id,   presence: true
  validates :day_id,          presence: true
  validates :price,           presence: true

end
