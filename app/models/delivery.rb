class Delivery < ApplicationRecord
  belongs_to :buy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :image,           presence: true
  validates :postcode,        presence: true
  validates :prefecture_id,   presence: true
  validates :city,            presence: true
  validates :address,         presence: true
  validates :phonenumber,     presence: true
end
