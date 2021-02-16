# README

# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
|first_name     | string | null: false |
|last_name      | string | null: false |
|first_name_kana| string | null: false |
|last_name_kana | string | null: false |
|birth_year     | string | foreign_key: true |
|birth_month    | string | foreign_key: true |
|birth_day      | string | foreign_key: true |

### Association

- has_many :items
- has_many :purchase
 

## items テーブル

| Column   | Type   | Options                        |
| ------   | ------ | ------------------------------ |
| name     | string | null: false                    |
| price    | string | null: false                    |
| user     |references| null: false,foreign_key:true |
| image    |        | null: false, foreign_key: true |
| where    | string | null: false                    |
| ship_day | text   | null: false, foreign_key: true |
| status   | text   | null: false, foreign_key: true |
| describe | text   | null: false                    |
| genre    | text   | null: false, foreign_key: true |
| ship_fee | text   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :purchase


## purchase テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| items   | references | null: false, foreign_key: true |
| price   | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :items
- has_one :address

## address テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
|post_number| string     | null: false                    |
|prefecture | references | null: false, foreign_key: true |
|city       | string     | null: false                    |
|street     | string     | null: false                    |
|building   | string     | null: false                    |
|phone      | string     | null: false                    |

### Association

- belongs_to :purchase
