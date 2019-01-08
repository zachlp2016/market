require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require 'pry'

class VendorTest < Minitest::Test

  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  def test_class_vendor_exists
    assert_instance_of Vendor, @vendor
  end

  def test_vendor_has_a_name
    assert_equal "Rocky Mountain Fresh", @vendor.name
  end

  def test_it_has_empty_inventory
    hash = {}
    assert_equal hash, @vendor.inventory
  end

  def test_it_can_check_stock
    assert_equal 0, @vendor.check_stock("Peaches")
  end

  def test_it_can_add_stock
    assert_equal 30, @vendor.stock("Peaches", 30)
  end

  def test_it_can_add_more_stock
    @vendor.stock("Peaches", 30)
    @vendor.stock("Peaches", 25)
    assert_equal 55, @vendor.check_stock("Peaches")
  end

  def test_it_can_add_another_stock
    hash = {"Peaches"=>55, "Tomatoes"=>12}
    @vendor.stock("Peaches", 30)
    @vendor.stock("Peaches", 25)
    @vendor.stock("Tomatoes", 12)
    assert_equal hash, @vendor.inventory
  end
end
