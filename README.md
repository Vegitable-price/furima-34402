# README


# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | unique: true|
|encrypted_password| string | null: false, null: false |
|first_name     | string | null: false |
|last_name      | string | null: false |
|first_name_kana| string | null: false |
|last_name_kana | string | null: false |
|birth_day      | date   | foreign_key: true |

### Association

- has_many :items
- has_many :purchases
 

## items テーブル

| Column      | Type     | Options                        |
| ------      | ------   | ------------------------------ |
| name        | string   | null: false                    |
| price       | integer  | null: false                    |
| user        |references| null: false,foreign_key:true   |
|prefecture_id| integer  | null: false                    |
|ship_day_id  |integer   | null: false,                   |
| status_id   | integer  | null: false,                   |
| describe    | text     | null: false                    |
| genre_id    | integer  | null: false,                   |
|ship_fee_id  | integer  | null: false,                   |

### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresss テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
|post_number| string     | null: false                    |
|prefecture_id| integer  | null: false,                   |
|city       | string     | null: false                    |
|street     | string     | null: false                    |
|building   | string     |                                |
|phone      | string     | null: false                    |
| purchase  | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

