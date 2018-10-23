## 動作
ruby lib/vending_machine.rb

## パス
`ユーザー任意/Vending_Machine_Practice/lib/vending_machine.rb`

## 自動販売機機能一覧
### 初期設定
`VendingMachine.new`
### 投入口
`VendingMachine.new.slot_money`
### 返却口
`VendingMachine.new.return_money`
### 購入ボタン
`VendingMachine.new.purchase`
### 商品一覧
`VendingMachine.new.select_view`
### 取り出し口
`VendingMachine.new.pull_drink`

## ユーザー操作
### お金を入れる
`VendingMachine.new.slot_money 100`
### 商品を買う
`VendingMachine.new.purchase 1`

## 管理者操作
### 在庫情報
`VendingMachine.new.stock_drink`
