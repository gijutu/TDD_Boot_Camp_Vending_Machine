class Vending_machine
  MONEY = [10, 50, 100, 500, 1000].freeze
  ITEM = ['コーラ': 120,'レッドブル': 200,'水': 100].freeze

  def initialize
    @slot_money = 0
    @sales = 0
    @coke_stock = 5
    @red_bull_stock = 5
    @water_stock = 5
    self.choice
  end

  def choice
    puts "在庫情報＊#{ITEM[0].keys[0]}#{ITEM[0].values[0]}円が#{@coke_stock}個,#{ITEM[0].keys[1]}#{ITEM[0].values[1]}円が#{@red_bull_stock}個,#{ITEM[0].keys[2]}#{ITEM[0].values[2]}円が#{@water_stock}個あります"
    puts "現在の売り上げは#{@sales}円です"
    puts '次から選んでください'
    puts '1:お金を入れる'
    puts '2:ジュースを購入する'
    puts '3:お金を払い戻す'
    puts "現在#{@slot_money}円投入されています"
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
    puts '---------------------------'
    puts 'お金を入れてください'
    money = gets.to_i
    puts '---------------------------'
    if MONEY.include?(money)
      @slot_money += money
    else
      puts '---------------------------'
      puts 'そのお金は想定の範囲外のお金です'
      puts "#{money}円返却します"
      puts '---------------------------'
    end
    self.choice
  end

  def return_money
    puts '---------------------------'
    puts "#{@slot_money}円返却します"
    puts '---------------------------'
  end

  def buy_drink
    puts '買うものを選んでください'
    if @slot_money >= ITEM[0].values[1]
      puts "1:コーラ#{ITEM[0].values[0]}円"
      puts "2:レッドブル#{ITEM[0].values[1]}円"
      puts "3:水#{ITEM[0].values[2]}円"
    elsif @slot_money >= ITEM[0].values[0] && @slot_money < ITEM[0].values[1]
      puts "1:コーラ#{ITEM[0].values[0]}円"
      puts "3:水#{ITEM[0].values[2]}円"
    else @slot_money >= ITEM[0].values[2] && @slot_money < ITEM[0].values[0]
      puts "3:水#{ITEM[0].values[2]}円"
    end
    drink_number = gets.to_i
    if drink_number == 1
      if @coke_stock == 0
        puts '---------------------------'
        puts '在庫がありません'
        puts '---------------------------'
      else
        price =ITEM[0].values[0].to_i
        if @slot_money >= price
          @price = price
          @sales = @price + @sales
          @slot_money = @slot_money - price
          @coke_stock = @coke_stock -1
          puts "#{@price.to_i}円で購入しました。"
          puts "#{@slot_money}円返却します。"
          @slot_money = 0
          puts '---------------------------'
          self.choice
        else
          puts '---------------------------'
          puts 'お金を追加してください'
          puts '---------------------------'
          self.slot_money
        end
       end
      elsif drink_number == 2
        if @red_bull_stock == 0
          puts '---------------------------'
          puts '在庫がありません'
          puts '---------------------------'
        else
          price =ITEM[0].values[1].to_i
          if @slot_money >= price
            @price = price
            @sales = @price + @sales
            @slot_money = @slot_money - price
            @red_bull_stock = @red_bull_stock -1
            puts "#{@price.to_i}円で購入しました。"
            puts "#{@slot_money}円返却します。"
            @slot_money = 0
            puts '---------------------------'
            self.choice
          else
            puts '---------------------------'
            puts 'お金を追加してください'
            puts '---------------------------'
            self.slot_money
          end
        end
      elsif drink_number == 3
        if @water_stock == 0
          puts '---------------------------'
          puts '在庫がありません'
          puts '---------------------------'
        else
          price =ITEM[0].values[2].to_i
          if @slot_money >= price
            @price = price
            @sales = @price + @sales
            @slot_money = @slot_money - price
            @water_stock = @water_stock -1
            puts "#{@price.to_i}円で購入しました。"
            puts "#{@slot_money}円返却します。"
            @slot_money = 0
            puts '---------------------------'
            self.choice
          else
            puts '---------------------------'
            puts 'お金を追加してください'
            puts '---------------------------'
            self.slot_money
          end
        end
      else
        puts '---------------------------'
        puts '１,２,３の数字を入力してください'
        puts '---------------------------'
        self.buy_drink
      end
    end

    def wrong_number
      puts '---------------------------'
      puts '１,２,3,4の数字を入力してください'
      puts '---------------------------'
    end

end

Vending_machine.new
