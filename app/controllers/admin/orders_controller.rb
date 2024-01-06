class Admin::OrdersController < ApplicationController
    before_action :authenticate_admin!
    
    def show
        @order = Order.find(params[:id])
        @order_items = OrderItem.where(order_id: params[:id])
    end
end
