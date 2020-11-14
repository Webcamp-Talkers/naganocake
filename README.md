# 長野ケーキ　ECサイト

##DMM WEBCAMPのチーム開発で作成するアプリ



##ER図
![ER図].(https://drive.google.com/file/d/1_v4dMdEZ4L7Kn53NXSaTr7FdB8yx3Lt8/view?ts=5f97d8d8)


 ##アプリケーション詳細設計図
 ![アプリケーション詳細設計図].(https://docs.google.com/spreadsheets/d/11AvBd6IbtY6lXfEG_GbwYsXboDELd0koVEVXohUQX88/edit?userstoinvite=kapibara.bba0924%40gmail.com&ts=5f97c9a4#gid=771301282)
HTTPメソッド	URL	コントローラ	アクション	目的
顧客側
enduser_homes
get	/	endusers_homes	endusers_top	ECサイトのトップページ
get	homes/endusers_about	endusers_homes	endusers_about	ECサイトの説明ページ
endusers
get	endusers/sign_in	devise/seesions	new	ログインページの表示
post	endusers/sign_in	devise/seesions	create	ログイン
delete	endusers/sign_out	devise/seesions	destroy	ログアウト
get	endusers/sign_up	devise/registrations	new	新規会員登録ページの表示
post	endusers	devise/registrations	create	新規会員登録
get	endusers	endusers	show	会員詳細ページの表示
get	endusers/edit	endusers	edit	会員情報編集ページの表示
patch	endusers	endusers	update	会員情報のアップデート
get	endusers/leaving	endusers	leaving	退会画面の表示
patch	endusers/leaving_out	endusers	leaving_out	退会する（有効から無効へ）
shipping_address
get	endusers/shipping_address	endusers/shipping_address	index	配送先住所の一覧
post	endusers/shipping_address	endusers/shipping_address	create	配送先住所の登録
get	endusers/shipping_address/:id/edit	endusers/shipping_address	edit	配送先住所の編集
patch	endusers/shipping_address/:id	endusers/shipping_address	update	配送先住所の変更
delete	endusers/shipping_address/:id	endusers/shipping_address	destroy	配送先住所の削除
items
get	endusers/items	endusers/items	Index	商品の一覧画面
get	endusers/items/:id	endusers/items	show	商品の詳細画面
orders
get	endusers/orders/new	endusers/orders	new	注文情報入力画面
post	endusers/orders/confirm	endusers/orders	confirm	注文情報確認画面
post	endusers/orders	endusers/orders	create	注文情報の確定
get	endusers/orders/thanks	endusers/orders	thanks	注文完了のメッセージ
get	endusers/orders	endusers/orders	index	注文履歴一覧画面
get	endusers/orders/:id	endusers/orders	show	注文履歴詳細画面
cart_items
get	endusers/cart_items	endusers/cart_items	index	カート商品を表示する
put	endusers/cart_items/:id	endusers/cart_items	update	カート商品の更新
post	endusers/cart_items	endusers/cart_items	create	カートの商品を追加、保存
delete	endusers/cart_items/:id	endusers/cart_items	destroy	カートの商品を消去
delete	endusers/cart_items	endusers/cart_items	all_destroy	カートの商品を一括消去

HTTPメソッド	URL	コントローラ	アクション	目的
管理者側
hostusers_homes
get	homes/hostusers_top	hostusers_homes	hostusers_top	ECサイトのトップページ(管理者側）
hostusers
get	hostusers/sign_in	devise/seesions	new	ログインページの表示
post	hostusers/sign_in	devise/seesions	create	ログイン
delete	hostusers/sign_out	devise/seesions	destroy	ログアウト
get	hostusers/endusers	hostusers	index	会員一覧ページの表示
get	hostusers/endusers/:id	hostusers	show	会員詳細ページの表示
get	hostusers/endusers/:id/edit	hostusers	edit	会員情報編集ページの表示
patch	hostusers/endusers/:id	hostusers	update	会員情報のアップデート
items
get	hostusers/items	hostusers/items	index	商品の一覧画面
get	hostusers/items/new	hostusers/items	new	新商品の制作フォーム
post	hostusers/items	hostusers/items	create	商品の作成
get	hostusers/items/:id	hostusers/items	show	商品の説明
get	hostusers/items/:id/edit	hostusers/items	edit	商品の編集
patch	hostusers/items/:id	hostusers/items	update	商品の更新
put	hostusers/items/:id	hostusers/items	update	商品画像の登録
orders
get	hostusers/orders	hostusers/orders	index	注文履歴一覧画面
get	hostusers/orders/:id	hostusers/orders	show	注文履歴詳細画面
patch	hostusers/orders/:id	hostusers/orders	update	注文履歴の更新
genres
get	hostusers/genres	hostusers/genres	index	ジャンル一覧、追加を表示
post	hostusers/genres	hostusers/genres	create	ジャンル追加
get	hostusers/genres/:id/edit	hostusers/genres	edit	ジャンルの編集画面
patch	hostusers/genres/:id	hostusers/genres	update	ジャンル編集を更新
order_items
patch	hostusers/order_items/:id	hostusers/order_items	update	注文商品の製作ステータスの更新

gem	用途
devise	ログイン機能
gem "refile", require: "refile/rails", github: 'manfe/refile'	画像投稿機能
gem "refile-mini_magick"	画像投稿機能
jp_prefecture	住所自動検索
bootstrap', '~> 4.4.1	デザイン、レイアウト
jquery-rails	デザイン、レイアウト
kaminari','~> 1.2.1	ページネーション

 ##機能
 - enduser
  - 会員登録・編集・退会
  - 商品の閲覧・カートに入れる・注文
  - ジャンル検索
  - 注文履歴の確認

- hostuser
  - ジャンル登録・編集・非表示選択
  - 商品の登録・編集・削除・非表示選択
  - 注文履歴の確認・進捗ステータスの変更
  - 会員情報の確認・編集

 #開発環境
 - Ruby 2.5.7
- Rails 5.2.4.1
- SQlite3 1.4.2
- HTML5
- CSS3
- Gems
  - Bootstrap3
  - jQuery-rails
  - kaminari
  - devies

##開発メンバー
  ## チーム名
  **Talkers!**

   ## メンバー
  * **masaya**
  * **atusi**
  * **tokio**
  * **haruna**

# 作成期間
  2020/10/25から2020/11/15