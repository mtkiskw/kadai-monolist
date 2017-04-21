class ItemsController < ApplicationController
  def new
    @items = []

    @keyword = params[:keyword]
    if @keyword
      results = RakutenWebService::Ichiba::Item.search({
        keyword: @keyword,
        imageFlag: 1,
        hits: 20,
      })

      results.each do |result|
        item = Item.find_or_initialize_by(read(result))
        @items << item
      end
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @want_users = @item.want_users
    @having_users = @item.having_users
  end
  
end
