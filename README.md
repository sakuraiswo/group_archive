# README

# アプリケーション名
Group Archive（グループ アーカイブ）

# アプリケーション概要
画像だけじゃなく、「言葉」も思い出として残すことができる。  
嬉しい言葉、笑える言葉、大切な言葉、すべて画像として残して共有できる。

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
2.YourRoomの「サンプルルーム」をクリックする。  
3.画面中央のチャット欄にある投稿内容右下の「Archive」ボタンをクリックする。  
4.右側に画像が追加される。画像にポインターを乗せると拡大画像が表示される。

## その他の機能
・メッセージ＆画像投稿機能  
・グループメモ機能  
・個人メモ機能（3か所）  
・アンケート機能  

# アプリケーションを作成した背景
家族や友達がチャットで送ってくれた言葉を、ときには思い出の写真と同じように大切にしたいときがあります。また、大切な相手であれば、相手の好みや趣味、記念日などを覚えていたいと思ったりします。ですが、大切にしたい言葉や情報も、いずれ普段のチャットのやり取りの中に埋もれてしまいます。そこで、記録に残したいと思ったときにすぐに、アルバムの中にしまうようなイメージで、保存できるチャットアプリを開発することにしました。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1I-EgpxF6DWjk98mKD3zFlLVFD0y9m8Qu9XVqvRaqRi0/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明
## チャット機能
文章と画像の投稿動画  
[![Image from Gyazo](https://i.gyazo.com/555a8600cc04effebfcd4188e83b9dd0.gif)](https://gyazo.com/555a8600cc04effebfcd4188e83b9dd0)
## アーカイブ機能  
投稿文章のアーカイブ動画  
[![Image from Gyazo](https://i.gyazo.com/9a533d3eaf1807909d45d5ac27e2577b.gif)](https://gyazo.com/9a533d3eaf1807909d45d5ac27e2577b)
## アンケート機能  
アンケートシート作成動画  
[![Image from Gyazo](https://i.gyazo.com/b64a95d0fc549f7d701ee506cc87f81f.gif)](https://gyazo.com/b64a95d0fc549f7d701ee506cc87f81f)
アンケート回答動画  
[![Image from Gyazo](https://i.gyazo.com/f26ae3b7f1a5e1b142e1bc478c0c0bc9.gif)](https://gyazo.com/f26ae3b7f1a5e1b142e1bc478c0c0bc9)
アンケートアーカイブ動画  
[![Image from Gyazo](https://i.gyazo.com/88d806586fd14868234297466b233de4.gif)](https://gyazo.com/88d806586fd14868234297466b233de4)

# 実装予定の機能
アーカイブ編集機能（アーカイブ画像の表示順の入替、補足情報付与などの機能）  
アルバム機能（アーカイブ画像をフォルダ毎に分けることのできる機能）  
リマインダー機能（連絡の予定などが通知される機能）  
カレンダー機能（予定が書き込める機能）  
スタンプ機能（スタンプを送ることのできる機能）  
リアクション機能（相手の投稿にリアクションを付けることのできる機能）  
壁紙着せ替え機能（チャットルーム毎に自由に壁紙を変えることのできる機能）  
特別演出機能（登録した日、例えば、誰かの誕生日などに特定の演出が起こる機能）  
MyMap作成機能（Maps JavaScript APIの利用。GoogleMap上にマークやテキストを載せることができ、Archive機能で保存できる機能）  
ルーレット機能（決められない事柄を運が決めてくれる機能）  
ChatGPT API利用（機能の概要は考え中）  
その他（フレンド管理機能、フレンド検索機能、非同期通信の実装、ルーム削除機能などの基本機能）

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/b128a08d200499869f6df6811c43627f.png)](https://gyazo.com/b128a08d200499869f6df6811c43627f)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/863e7156bd3e11487e22547444aa648c.png)](https://gyazo.com/863e7156bd3e11487e22547444aa648c)

# 開発環境
・フロントエンド HTML,CSS,JavaScript  
・バックエンド Ruby, Ruby on Rails  
・インフラ Linux,Render  
・テスト Rspec  
・テキストエディタ VScode  
・タスク管理 GitHub  

# ローカルでの動作方法
以下のコマンドを順に実行。  
% git clone https://github.com/sakuraiswo/group_archive.git  
% cd group_archive  
% bundle install  
% yarn install

# 工夫したポイント
・テキストを画像として残すために、html2canvasというライブラリを使用しました。その際にfetch APIと組み合わせることで、データベースへ保存できるようにしました。  
・ただのチャットアプリではなく、グループで作ることのできるホームページをイメージして、共通メモスペースを実装しました。



