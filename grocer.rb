require 'pry'

def consolidate_cart(cart)
  final_hash = {}
  cart.each do |item_hash|
    item_name = item_hash.keys[0]
    if final_hash.has_key?(item_name)
      final_hash[item_name][:count] += 1 
    else 
      final_hash[item_name] = {
        :price => item_hash[item_name][:price],
        :clearance => item_hash[item_name][:clearance],
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
  total = 0 
  new_cart = consolidate_cart(cart) 
  coupon_cart = apply_coupons(new_cart, coupons) 
  clearance_cart = apply_clearance(coupon_cart) 
  clearance_cart.each do |item, attribute_hash| 
    total += (attribute_hash[:price] * attribute_hash[:count])
  end 
  total = (total * 0.9) if total > 100 total 
end

def checkout(cart, coupons)
  # code here
end
