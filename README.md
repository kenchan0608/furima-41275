# テーブル設計

## Users テーブル
| Column     | Type   | Options                        |
|------------|--------|--------------------------------|
| id         | bigint | PK, not null, auto_increment   |
| nickname   | string | null: false                    |
| email      | string | null: false, unique: true      |
| password   | string | null: false                    |
| real_name  | string | null: false                    |
| birth_date | date   | null: false                    |

### Association
- has_one :buyer_info
- has_many :items
- has_many :comments

---

## BuyerInfos テーブル
| Column       | Type   | Options                        |
|--------------|--------|--------------------------------|
| id           | bigint | PK, not null, auto_increment   |
| user_id      | bigint | null: false, foreign_key: true |
| postal_code  | string | null: false                    |
| prefecture   | string | null: false                    |
| city         | string | null: false                    |
| address      | string | null: false                    |
| building     | string |                                |
| phone_number | string | null: false                    |

### Association
- belongs_to :user
- belongs_to :item (購入時に紐づける場合)

---

## Items テーブル
| Column               | Type    | Options                        |
|-----------------------|---------|--------------------------------|
| id                    | bigint  | PK, not null, auto_increment   |
| user_id               | bigint  | null: false, foreign_key: true |
| name                  | string  | null: false                    |
| description           | text    | null: false                    |
| price                 | integer | null: false                    |
| condition             | string  | null: false                    |
| shipping_cost_burden  | string  | null: false                    |
| shipping_area         | string  | null: false                    |
| shipping_days         | string  | null: false                    |
| image_url             | string  |                                |

### Association
- belongs_to :user
- has_many :comments
- has_one :buyer_info

---

## Comments テーブル
| Column     | Type   | Options                        |
|------------|--------|--------------------------------|
| id         | bigint | PK, not null, auto_increment   |
| user_id    | bigint | null: false, foreign_key: true |
| item_id    | bigint | null: false, foreign_key: true |
| content    | text   | null: false                    |

### Association
- belongs_to :user
- belongs_to :item

---

# ER 図のリレーションまとめ
- Users : BuyerInfos = 1 : 1
- Users : Items = 1 : N
- Users : Comments = 1 : N
- Items : Comments = 1 : N
- Items : BuyerInfos = 1 : 1
