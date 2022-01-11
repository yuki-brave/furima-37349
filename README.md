# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_day_id       | date   | null: false |

### Association

- has_many :products
- has_many :purchases


## products テーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| title                  | string     | null: false |
| text                   | text       | null: false |
| price                  | integer    | null: false |
| category_id            | integer    | null: false |
| condition_id           | integer    | null: false |
| shipping_cont_id       | integer    | null: false |
| shipping_prefecture_id | integer    | null: false |
| shipping_days_id       | integer    | null: false |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase


##  purchases テーブル

| Column                      | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
| user                        | references | null: false, foreign_key: true |
| product                     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :destination


## destinations テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| post_code              | string     | null: false                    |
| shipping_prefecture_id | integer    | null: false                    |
| city                   | string     | null: false                    |
| address                 | string     | null: false                    |
| building_name          | string     |                                |
| telephone_number       | string     | null: false                    |
| purchase               | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

