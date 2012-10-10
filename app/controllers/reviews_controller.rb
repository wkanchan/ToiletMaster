class ReviewsController < ApplicationController

  respond_to :xml, :html, :json

  # GET /reviews
  # GET /reviews.json
  # GET /reviews.xml
  def index
    @reviews = Review.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
      format.xml { respond_with @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  # GET /reviews/1.xml
  def show
    @review = Review.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
      format.xml { respond_with @review }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.json
  def new
    @review = Review.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(params[:review])
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to root_path, notice: 'Review was successfully created.' }
        format.json { render json: @review, status: :created, location: @review }
        # for AJAX request
        format.js { @review }    # { @review } to send the new @review to be referenced in the JavaScript code!
      else
        #format.html { render action: "new" }
        format.html { redirect_to root_path }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.json
  def update
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to root_path, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy

    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Review was successfully removed.' }
      format.json { head :no_content }
      # for AJAX request
      format.js { @review }
    end
  end
end
