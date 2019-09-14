require 'pry'

def consolidate_cart(cart)
  final_hash = {}
  cart.each do |element_hash|
    element_name = element_hash.keys[0]
    if final_hash.has_key?(element_name)
      final_hash[element_name][:count] += 1 
    else 
      final_hash[element_name] = {
        :price => element_hash[element_name][:price],
        :clearance => element_hash[element_name][:clearance],
        :count => 1
      }
    end
  end
  final_hash
end

def apply_coupons(cart, coupons)
  final_hash = {}  
  coupons.each do |coupon|
    item = coupon[:item]
    if cart[item] && cart[item][:count] >= coupon[:num]
      final_hash[]
    end
       
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
