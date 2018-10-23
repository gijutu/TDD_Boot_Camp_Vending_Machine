## 動作
ruby lib/vending_machine.rb
で動きます。
## 絶対パスで動かなかったので,requireを相対パスに。
 ユーザー任意/Vending_Machine_Practice/lib/vanding_/machine.rb
# ユーザー操作一覧
# 初期設定
Vender.new
# 投入口
Vender.new.slot_money
# 返却口
Vender.new.return_money
# 品物買える
Vender.new.purchase
# 取り出し口
Vender.new.pull_drink
# 在庫情報
Vender.new.stock_drink
