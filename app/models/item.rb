class Item < ApplicationRecord
  has_one_attached :image

  validates :name,            presence: true                    
  validates :explain,         presence: true                       
  validates :category_id,     presence: true                    
  validates :condition_id,    presence: true                    
  validates :shipping_id,     presence: true                    
  validates :prefecture_id,   presence: true                    
  validates :day_id,          presence: true                    
  validates :price,           presence: true   
end
