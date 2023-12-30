class CartItem < ApplicationRecord
    belongs_to :item
    
    def subtotal
        item.add_tax_included_price * amount
    end
end
