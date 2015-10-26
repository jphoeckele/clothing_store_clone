class CartController < ApplicationController
	before_action :authenticate_user!, except: [:index]

	def add
		id = params[:id]
		#if cart has been created use existing cart or create new cart.
		if session[:cart] then
			cart = session[:cart]
		else
			session[:cart] = {}
			cart = session[:cart]
		end
		#if item has been added to cart increment cart by 1 else set to 1.
		if cart[id] then
			cart[id] = cart[id] + 1
		else
			cart[id] = 1
		end
		redirect_to :action => :index
	end

	def clearCart
		session[:cart] = nil
		redirect_to :action => :index
	end
#if there is a cart pass it to display else pass empty value.
	def index
		if session[:cart] then
			@cart = session[:cart]
		else
			@cart = {}
		end
	end
end
