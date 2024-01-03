class CartItem < ApplicationRecord
    belongs_to :item
    belongs_to :customer
    
    def subtotal
        item.add_tax_included_price * amount
    end
end
