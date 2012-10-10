class StaticPagesController < ApplicationController
  def home
    @reviews = Review.all
    @review = current_user.reviews.build if signed_in?

    @toilets = Toilet.all
    @toilet_list = [["Select a toilet to review",-1]]
    @toilets.each do |t|
      @toilet_list << [t.name,t.id]
    end
  end

  def help
  end

  def about

  end

  def contact

  end
end
