def stock_picker(stock)
  best_option = stock.reduce(Hash.new(0)) do |best, buy|
    buy_day = stock.index(buy)
    stock.each_with_index do |sell, sell_day|
      next if buy_day > sell_day
      profit_day = sell - buy
      next unless profit_day > 0 && best[:profit] < profit_day
      best[:profit] = profit_day
      best[:days] = [buy_day, sell_day]
    end
    best
  end
  best_option[:days]
end

p stock_picker([170000,10000,6000000,90000,15,8,600,1000,10])
p stock_picker([17,3,6,9,15,8,6,1,10])