class RankingsController < ApplicationController
  def want
    @ranking_counts = Want.ranking
    @items = Item.find(@ranking_counts.keys)
  end
  
  def having
    @ranking_counts = Having.ranking
    @items = Item.find(@ranking_counts.keys)
  end
end
