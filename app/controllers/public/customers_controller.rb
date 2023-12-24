class Public::CustomersController < ApplicationController
    before_action :authenticate_customer!
    
    def show
        @customer = current_customer
        @full_name = @customer.last_name + "　" + @customer.first_name
        @full_name_kana = @customer.last_name_kana + "　" + @customer.first_name_kana
    end
    
    def edit
    end
    
    def update
    end
    
    def confirm
    end
    
    def withdraw
    end
    
end
