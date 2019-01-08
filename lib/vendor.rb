require 'pry'

class Vendor

  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(stock)
    if @inventory == {}
      stock = 0
    else
      @inventory.each do |item|
        if item.first == stock
          item.last
        else item == nil
          @inventory[stock] = 0
        end
      end
    end
  end
  def stock(item, number)
    @inventory[item] = number
  end
end
