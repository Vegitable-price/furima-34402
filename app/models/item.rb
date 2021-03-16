class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one    :purchase
  has_many_attached :images
  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations
  belongs_to :genre
  belongs_to :prefecture
  belongs_to :ship_day
  belongs_to :status
  belongs_to :ship_fee
  belongs_to :user
end
