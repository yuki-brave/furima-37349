# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_day_id       | integer| null: false |

### Association

- has_many :products
- has_one :purchases


## products テーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| title                  | string     | null: false |
| text                   | string     | null: false |
| price                  | string     | null: false |
| category_id            | integer    | null: false |
| condition_id           | integer    | null: false |
| shipping_cont_id       | integer    | null: false |
| shipping_prefecture_id | integer    | null: false |
| shipping_days_id       | integer    | null: false |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchases

- has_one_attached :image


##  purchases テーブル

| Column                      | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
| payment                     | integer    | null: false                    |
| credit_card_number          | integer    | null: false                    |
| credit_card_expiration_date | integer    | null: false                    |
| credit_card_security_code   | integer    | null: false                    |
| user                        | references | null: false, foreign_key: true |
| product                     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :destination


## destinations テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| adress           | string     | null: false                    |
| building_name    | string     | null: false                    |
| telephone_number | integer    | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

