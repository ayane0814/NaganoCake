class Admin::OrdersController < ApplicationController
    before_action :authenticate_admin!
    
    def show
        @order = Order.find(params[:id])
        @order_items = OrderItem.where(order_id: params[:id])
        @total_item_amount = @order_items.sum{|order_item| order_item.subtotal}
    end
end
