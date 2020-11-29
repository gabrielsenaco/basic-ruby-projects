# frozen_string_literal: true

def best_profit(stock, buy, buy_day, best)
  stock.each_with_index do |sell, sell_day|
    next if buy_day > sell_day

    profit = sell - buy
    next unless profit.positive? && best[:profit] < profit

    best[:profit] = profit
    best[:days] = [buy_day, sell_day]
  end
end

def stock_picker(stock)
  best_option = stock.each_with_object(Hash.new(0)) do |buy, best|
    buy_day = stock.index(buy)
    best_profit(stock, buy, buy_day, best)
  end
  best_option[:days]
end

p stock_picker([170_000, 10_000, 6_000_000, 90_000, 15, 8, 600, 1000, 10])
p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
