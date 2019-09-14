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
  coupons.each do |coupon|
    coupon.each do |attribute, value|
      name = coupon[:item] 
      if cart[name] && cart[name][:count] >= coupon[:num]
        if cart["#{name} W/COUPON"]
          cart["#{name} W/COUPON"][:count] += 1 
        else
          cart["#{name} W/COUPON"] = {:price => coupon[:cost], :clearance => cart[name][:clearance], :count => 1}
        end
        cart[name][:count] -= coupon[:num] 
    end 
  end 
end 
  cart 
       
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
