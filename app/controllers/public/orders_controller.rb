class Public::OrdersController < ApplicationController
    before_action :authenticate_coutomer!
end
