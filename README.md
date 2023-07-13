# DB設計
## usersテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| nickname | string | null: false |
| email | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| date_of_birth | date | null: false |

### Association
- has_many :items

## itemsテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| name | string | null: false |
| description | text | null: false |
| price | integer | null: false |
| category_id | integer | null: false |
| condition_id | integer | null: false |
| shipping_charge_id | integer | null: false |
| shipping_date_id | integer | null: false |
| prefecture_id | integer | null: false |
| user(FK) | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## ordersテーブル

|Column|Type|Options|
| user_id | integer | null: false, foreign_key: true |
| items_id | integer | null: false, foreign_key: true |
| address | integer | null: false, foreign_key: true |


### Association
- belongs_to :item
- has_one :address

## addressesテーブル

|Column|Type|Options|
| postal_code | integer | null: false |
| prefecture | strings | null: false |
| city | integer | null: false |
| house_number | integer | null: false |
| building | strings | null: false |
| phone_number | integer | null: false |



### Association
- belongs_to :order