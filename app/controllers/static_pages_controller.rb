class StaticPagesController < ApplicationController
  def home

    @reviews = Review.all
  end

  def help
  end

  def about

  end

  def contact

  end
end
