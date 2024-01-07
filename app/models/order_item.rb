class OrderItem < ApplicationRecord
    belongs_to :item
    belongs_to :order
    
    def subtotal
        quantity * item.add_tax_included_price
    end
end
