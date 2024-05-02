# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| profile            | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :chats
- has_many :question_sheets
- has_many :answers
- has_many :memos
- has_many :archives


## rooms テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| room_name         | string  | null: false |
| group_memo        | text    | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :chats
- has_many :question_sheets
- has_many :memos
- has_many :archives


## room_users テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| user_id           | references | null: false, foreign_key: true |
| room_id           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room



## chats テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| message           | text       | null: false |
| user_id           | references | null: false, foreign_key: true |
| room_id           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room
- has_one_attached :image


## question_sheets テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| question          | text       | null: false |
| user_id           | references | null: false, foreign_key: true |
| room_id           | references | null: false, foreign_key: true |

### Association

- has_many :options
- has_many :answers
- belongs_to :user
- belongs_to :room


## options テーブル

| Column                  | Type       | Options     |
| ----------------------- | ---------- | ----------- |
| title                   | text       | null: false |
| question_sheet_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :question_sheet
- has_many :answers


## answers テーブル

| Column                  | Type       | Options     |
| ----------------------- | ---------- | ----------- |
| answer_text             | text
| user_id                 | references | null: false, foreign_key: true |
| question_sheet_id       | references | null: false, foreign_key: true |
| option_id               | references | null: true, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :question_sheet
- belongs_to :option


## memos テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| my_memo           | text       
| my_icon           | text       
| user1_memo        | text       
| user2_memo        | text       
| user_id           | references | null: false, foreign_key: true |
| room_id           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room
- has_one_attached :image

## archives テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| supplement        | string       
| display_order     | float      | null: false |
| user_id           | references | null: false, foreign_key: true |
| room_id           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room
- has_one_attached :image