class Public::OrdersController < ApplicationController
    before_action :authenticate_customer!
    
    def new
        @order = Order.new
    end
    
    def confirm
        @order = Order.new(order_params)
        @order.post_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.address_name = current_customer.fullname
        @cart_items = current_customer.cart_items.all
        @total_amount = 0
    end
    
    def thanks
    end
    
    def create
    end
    
    def index
    end
    
    def show
    end
    
    private
    
    def order_params
        params.require(:order).permit(:payment_method)
    end
end
