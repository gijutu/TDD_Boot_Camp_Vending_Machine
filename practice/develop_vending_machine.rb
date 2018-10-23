require '/Users/michishitatsubasa/workspace/Vending_Machine_Practice/lib/drink'

class Vending_machine
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

  def choice
    puts "在庫情報＊#{@coke.name}が#{@coke_stock}個、
      #{@red_bull.name}が#{@red_bull_stock}個、
      #{@water.name}が#{@water_stock}個"
    puts "現在の売り上げは#{@sales}円です\n1:お金を入れる
      \n2:ジュースを購入する \n3:お金を払い戻す
      \n現在#{@slot_money}円投入されています"
    number = gets.to_i

    if number == 1
      @slot_money = self.slot_money
    elsif number == 2
      @buy_drink = self.buy_drink
    else number ==3
      self.return_money
    end

  end

  def slot_money
    puts 'お金を入れてください'
    money = gets.to_i
    if MONEY.include?(money)
      @slot_money += money
    else
      puts "そのお金は想定の範囲外のお金です#{money}円返却します"
    end
    self.choice
  end

  def return_money
    puts "#{@slot_money}円返却します"
  end

  def buy_drink
    puts '買うものを選んでください'
    if @slot_money >= @red_bull.price
      puts "1:コーラ#{@coke.price}円 \n2:レッドブル#{@red_bull.price}円 \n3:水#{@water.price}円"
    elsif @slot_money >= @coke.price && @slot_money < @red_bull.price
      puts "1:コーラ#{@coke.price}円 \n3:水#{@water.price}円"
    else @slot_money >= @water.price && @slot_money < @coke.price
      puts "3:水#{@water.price}円"
    end
    drink_number = gets.to_i
    if drink_number == 1
      if @coke_stock == 0
        puts '在庫がありません'
      else
        if @slot_money >= @coke.price
          @sales = @coke.price + @sales
          @slot_money = @slot_money - @coke.price
          @coke_stock = @coke_stock -1
          puts "#{@coke.price}円で購入しました。\n#{@slot_money}円返却します。"
          @slot_money = 0
          self.choice
        else
          puts 'お金を追加してください'
          self.slot_money
        end
       end
      elsif drink_number == 2
        if @red_bull_stock == 0
          puts '在庫がありません'
        else
          if @slot_money >= @red_bull.price
            @sales = @red_bull.price + @sales
            @slot_money = @slot_money - @red_bull.price
            @red_bull_stock = @red_bull_stock -1
            puts "#{@red_bull.price}円で購入しました。\n#{@slot_money}円返却します。"
            @slot_money = 0
            self.choice
          else
            puts 'お金を追加してください'
            self.slot_money
          end
        end
      elsif drink_number == 3
        if @water_stock == 0
          puts '在庫がありません'
        else
          if @slot_money >= @water.price
            @sales = @water.price + @sales
            @slot_money = @slot_money - @water.price
            @water_stock = @water_stock -1
            puts "#{@water.price}円で購入しました。\n#{@slot_money}円返却します。"
            @slot_money = 0
            self.choice
          else
            puts 'お金を追加してください'
            self.slot_money
          end
        end
      else
        puts '１,２,３の数字を入力してください'
        self.buy_drink
      end
    end

    def wrong_number
      puts '１,２,3,4の数字を入力してください'
    end

end

Vending_machine.new.choice
