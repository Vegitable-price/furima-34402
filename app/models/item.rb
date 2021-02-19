class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one    :purchase
  has_one_attached :image
  belongs_to :genre
  belongs_to :prefecture
  belongs_to :ship_day
  belongs_to :status
  belongs_to :ship_fee

  with_options presence: true do
    validates :name
    validates :price, format: { with: /^[0-9]+$/ }
    validates :image
    with_options numericality: { other_than: 0 } do
    validates :genre_id
    validates :prefecture_id
    validates :ship_day_id
    validates :status_id
    validates :ship_fee_id
    end
  end
end
