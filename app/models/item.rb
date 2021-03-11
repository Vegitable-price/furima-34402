class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one    :purchase
  has_many_attached :images
  belongs_to :genre
  belongs_to :prefecture
  belongs_to :ship_day
  belongs_to :status
  belongs_to :ship_fee

  validates :price, format: { with: /\A[0-9]+\z/ }
  validates_numericality_of :price, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999
  with_options presence: true do
    validates :name
    validates :images
    validates :price
    validates :describe
    with_options numericality: { other_than: 0 } do
      validates :genre_id
      validates :prefecture_id
      validates :ship_day_id
      validates :status_id
      validates :ship_fee_id
    end
  end
end
