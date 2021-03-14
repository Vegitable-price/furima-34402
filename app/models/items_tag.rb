class ItemsTag

  include ActiveModel::Model
  attr_accessor :name, :describe, :price, :prefecture_id, :ship_fee_id, :ship_day_id, :status_id, :genre_id, :tag_name, :images, :user_id

  with_options presence: true do
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates_numericality_of :price, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999
    validates :name
    validates :images, :images, presence: true
    validates :price
    validates :describe
    validates :tag_name
    with_options numericality: { other_than: 0 ,message: 'を選択してください'} do
      validates :genre_id
      validates :prefecture_id
      validates :ship_day_id
      validates :status_id
      validates :ship_fee_id
    end
  end

  def save
    item = Item.create(name: name, describe: describe, price: price, prefecture_id: prefecture_id, ship_fee_id: ship_fee_id, ship_day_id: ship_day_id, status_id: status_id, genre_id: genre_id, images: [])
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end
end

  