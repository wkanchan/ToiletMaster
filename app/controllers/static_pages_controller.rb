class StaticPagesController < ApplicationController
  def home
    @reviews = Review.all
    @review = current_user.reviews.build if signed_in?

    @toilets = Toilet.all
    @toilet_list = []
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
