class Public::CartItemsController < ApplicationController
    before_action :authenticate_coutomer!
end
