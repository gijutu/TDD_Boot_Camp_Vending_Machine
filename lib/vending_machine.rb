require '/Users/michishitatsubasa/workspace/Vending_Machine_Practice/lib/drink'

class Vender
  MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize
    @slot_money = 0
    @sales = 0
    @coke_stock = 5
    @red_bull_stock = 5
    @water_stock = 5
    @coke = Drink.new("コーラ", 120)
    @red_bull = Drink.new("レッドブル",200)
    @water = Drink.new("水", 100)
  end
# お金を投入できる、複数回投入できる
  def slot_money(money)
    if MONEY.include?(money)
      @slot_money += money
      puts "現在#{@slot_money}円投入されています"
    else
      puts "そのお金は想定の範囲外のお金です#{money}円返却します"
    end
  end
# 投入金額と商品の金額を差し引いた金額が返却できる
  def return_money
    @return_money = @slot_money - @coke.price
    puts @return_money
  end
# 買えるものを表示させることができる
  def select_view
    if @slot_money >= @red_bull.price
      puts "1:コーラ#{@coke.price}円 \n2:レッドブル#{@red_bull.price}円 \n3:水#{@water.price}円"
    elsif @slot_money >= @coke.price && @slot_money < @red_bull.price
      puts "1:コーラ#{@coke.price}円\n3:水#{@water.price}円"
    elsif @slot_money >= @water.price && @slot_money < @coke.price
      puts "3:水#{@water.price}円"
    else
      puts "買えるものがありません"
      self.slot_money
    end
    self.purchase
  end
# 購入することができる
# 買ったら自動で在庫数が動くメソッドを作る
  def purchase(drink_number)
    if drink_number == 1 && @coke_stock >= 1 && @slot_money >= @coke.price
      @coke_stock -= 1
      @drink = @coke
      self.pull_drink_money
    elsif drink_number == 2 && @red_bull_stock >= 1 && @slot_money >= @red_bull.price
      @red_bull_stock -= 1
      @drink = @red_bull
      self.pull_drink_money
    elsif drink_number == 3 && @water_stock >= 1 && @slot_money >= @water.price
      @water_stock -= 1
      @drink = @water
      self.pull_drink_money
    else
      puts '購入できません'
    end
  end
# 買ったものをだすことができる、switchメソッドで在庫が減ったものが出力される
# お釣りを返却する
  def pull_drink_money
    puts @drink.name
    puts @slot_money -= @drink.price
    @slot_money = 0
  end
# 在庫情報が見られる
  def stock_drink
    puts "在庫情報＊#{@coke.name}が#{@coke_stock}個、#{@red_bull.name}が#{@red_bull_stock}個、#{@water.name}が#{@water_stock}個"
  end

end

Vender.new.purchase 1
