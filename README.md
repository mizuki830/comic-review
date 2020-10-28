# README

アプリケーション名	漫画のレビューアプリケーション

アプリケーション概要	漫画のレビューができる。同じ漫画が好きな人とのコミュニケーションが取れる

URL	https://comic-review-8429777.herokuapp.com/

テスト用アカウント	(ログイン機能等を実装した場合は、記述しましょう。またBasic認証等を設けている場合は、そのID/Passも記述しましょう。)

利用方法	閲覧はログインせずにみれますが、ユーザー登録を行いroom制作、レビューが行える

目指した課題解決	趣味である漫画ですが、他者の意見を取り入れる場が少なく、自分の感想に共感してくれたり、違う意見をもらったりできる環境が少かったりするので、情報共有の場の提供をしたかった。

洗い出した要件	
・ユーザー登録機能（ユーザーを特定するため）
・room一覧表示機能（どのようなroomがあるのか確認するため）
・room作成機能（レビューをできるroomを作成するため）ログインユーザーのみ可
・room詳細機能（レビューをできるroomの詳細を確認するため）
・room編集機能（レビューをできるroomの編集を行うため）ログインユーザーのみ＆作成者のみ可
・room削除機能（レビューをできるroomの削除を行うため）ログインユーザーのみ＆作成者のみ可
・レビュー投稿機能（レビューの投稿を行うため）ログインユーザーのみ可
・タグ登録機能（roomにタグをつけて検索しやすいようにするため）ログインユーザーのみ可
・キーワード検索機能（検索をできるようになるため）
・レビュー評価機能（レビューにいいねを付けれるようにするため（非同期通信））ログインユーザーのみ可
・レビューの一覧の順番を、いいねの数などに変更可能にする（レビューをいろんな視点で見れるため）

実装した機能についてのGIFと説明	(実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。)

実装予定の機能	
・ユーザー登録機能（ユーザーを特定するため）
・room一覧表示機能（どのようなroomがあるのか確認するため）
・room作成機能（レビューをできるroomを作成するため）ログインユーザーのみ可
・room詳細機能（レビューをできるroomの詳細を確認するため）
・room編集機能（レビューをできるroomの編集を行うため）ログインユーザーのみ＆作成者のみ可
・room削除機能（レビューをできるroomの削除を行うため）ログインユーザーのみ＆作成者のみ可
・レビュー投稿機能（レビューの投稿を行うため）ログインユーザーのみ可
・タグ登録機能（roomにタグをつけて検索しやすいようにするため）ログインユーザーのみ可
・キーワード検索機能（検索をできるようになるため）
・レビュー評価機能（レビューにいいねを付けれるようにするため（非同期通信））ログインユーザーのみ可
・レビューの一覧の順番を、いいねの数などに変更可能にする（レビューをいろんな視点で見れるため）

データベース設計	
# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many :rooms
- has_many :reviews
- has_many :tags

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string |             |
| comic  | string |             |
| agenda | text   | null: false |

### Association

- belongs_to :user
- has_many :reviews
- has_many :room_tags
- has_many :tags, through :room_tags

## tags テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| tag    | string     |                   |

### Association

- belongs_to :user
- has_many :room_tags
- has_many :room, through :room_tags

## room_tags テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| tag     | references | foreign_key: true              |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :tag

## reviews テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| review  | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

ローカルでの動作方法	% git clone https://github.com/mizuki830/comic-review.git   rails _6.0.0_
(git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。)