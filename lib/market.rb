class Market

  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
    @total_inventory = total_inventory
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    arr = []
    @vendors.each do |vendor|
      arr << vendor.name
    end
    arr
  end

  def vendors_that_sell(product)
    arr = []
    @vendors.each do |vendor|
      vendor.inventory.keys.each do |key|
        if key == product
          arr << vendor
        end
      end
    end
    arr
  end

  def sorted_item_list
    arr = []
    @vendors.each do |vendor|
      vendor.inventory.keys.each do |word|
        arr << word
      end
    end
    by_alphabetical = arr.sort_by do |word|
      word.downcase
    end
    by_alphabetical.uniq
  end

  def total_inventory
    @vendors.each do |vendor|
      binding.pry
      @total_inventory[vendor.key] = values
    end

    # @inventory[item] = number

  end
end
