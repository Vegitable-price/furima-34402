class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,           null: false
      t.integer    :price,          null: false
      t.references :user,           null:false, foreign_key: true
      t.integer    :prefecture_id,  null: false
      t.integer    :ship_day_id,    null: false
      t.integer    :status_id,      null: false
      t.text       :describe,       null: false
      t.integer    :genre_id,       null: false
      t.integer    :ship_fee_id,    null: false
      t.timestamps
    end
  end
end
