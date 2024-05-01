# README



# アプリケーション名
Group Archive（グループ アーカイブ）

# アプリケーション概要
画像だけじゃなく、「言葉」も思い出として残すことができる。
嬉しい言葉、笑える言葉、大事な言葉、すべて画像で残して共有できる。

# URL
https://group-archive.onrender.com

# テスト用アカウント
・Basic認証ID：admin
・Basic認証パスワード：1111
ユーザー1
・メールアドレス：a@a
・パスワード：aaa111
ユーザー2
・メールアドレス：b@b
・パスワード：aaa111
ユーザー3
・メールアドレス：c@c
・パスワード：aaa111


# 利用方法
## アーカイブ機能
1.ログインページからテスト用アカウントでログインする。
2.YourRoomの「〇〇()()」をクリックする。
3.投稿内容右下の「Archive」ボタンをクリックする。
4.右側に追加された画像にポインターを乗せると拡大画像が表示される。

## サブ機能
・メッセージ＆画像投稿機能
・グループメモ機能
・個人メモ機能（3か所）
・アンケート機能

# アプリケーションを作成した背景

# 洗い出した要件

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能

# データベース設計

# 画面遷移図
![Logo](images/screen_transition_diagram.png)

<br>

## ER図
![Logo](images/entity_relationship_diagram.png)

<br><br>

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
| user1_memo        | text       
| user2_memo        | text       
| user_id           | references | null: false, foreign_key: true |
| room_id           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room


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