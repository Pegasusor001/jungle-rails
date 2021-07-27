class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # ActionController inherient from base
  # cart, enhanced are globally available as they are classed at higher level. 
  protect_from_forgery with: :exception
  
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    puts @current_user
  end
  helper_method :current_user
  # a ||= b 等同于语句 a || a = b 

  def cart
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end
  helper_method :cart

  def enhanced_cart
    @enhanced_cart ||= Product.where(id: cart.keys).map {|product| { product:product, quantity: cart[product.id.to_s] } }
  end
  helper_method :enhanced_cart

  def cart_subtotal_cents
    enhanced_cart.map {|entry| entry[:product].price_cents * entry[:quantity]}.sum
  end
  helper_method :cart_subtotal_cents


  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end

end


# class A 
#   intialize a

# end 

# class B extend A
#   A.a will be inherit in B 
# end 


