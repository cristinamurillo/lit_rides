class ReviewsController < ApplicationController

  def show
    set_review
  end

  def new
    # byebug
    @user = User.find(params[:user].to_i)
    @review = Review.new 
  end

  def create
    @review = Review.new(reviews_params)
    if @review.valid?
      @review.save
      redirect_to @review
    else
      flash[:errors] = @review.errors.full_messages
      redirect_to new_review_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def reviews_params
    params.require(:review).permit(:title, :rating, :content, :ride_id)
  end


end
