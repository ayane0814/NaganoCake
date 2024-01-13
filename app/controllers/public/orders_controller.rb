class Public::OrdersController < ApplicationController
    before_action :authenticate_customer!
    
    def new
        @order = Order.new
    end
    
    def confirm
        @order = Order.new(order_params)
        @order.shipping_fee = 800
        @order.address_name = current_customer.fullname
        @order.post_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.customer_id = current_customer.id
        @cart_items = current_customer.cart_items.all
        @total_amount = 0
    end
    
    def thanks
    end
    
    def create
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        @order.save
        
        current_customer.cart_items.each do |cart_item|
            @order_item = OrderItem.new
            @order_item.order_id = @order.id
            @order_item.item_id = cart_item.item_id
            @order_item.uniti_price_including_tax = cart_item.item.add_tax_included_price
            @order_item.quantity = cart_item.amount
            @order_item.save
        end
        
        current_customer.cart_items.destroy_all
        redirect_to thanks_orders_path
    end
    
    def index
        @orders = current_customer.orders.order(created_at: :desc).includes(:order_items, :customer)
    end
    
    def show
        @order = Order.find(params[:id])
        @order_items = OrderItem.where(order_id: params[:id])
        @total_item_amount = @order_items.sum{|order_item| order_item.subtotal}
    end
    
    private
    
    def order_params
        params.require(:order).permit(:customer_id, :address_name, :post_code, :address, :shipping_fee, :billing_amount, :payment_method)
    end
end
