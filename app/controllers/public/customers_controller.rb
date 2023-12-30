class Public::CustomersController < ApplicationController
    before_action :authenticate_customer!
    
    def show
        @customer = current_customer
    end
    
    def edit
        @customer = current_customer
    end
    
    def update
        # ここで止まってる
        @customer = Customer.find(params[current_customer.id])
        @customer.update
        redirect_to show_customer_path
    end
    
    def confirm
    end
    
    def withdraw
    end
    
end
