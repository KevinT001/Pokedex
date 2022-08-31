class RegionsController < ApplicationController
  def index  
    @regions = Region.all.order_by_creation
  end

  def show
    @region = Region.find(params[:id])
  end
end 