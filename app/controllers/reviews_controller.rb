class ReviewsController < ApplicationController

  def show
    set_review
  end

  def new
    # byebug
    @user = User.find(params[:user].to_i)
    @ride = Ride.find(params[:ride].to_i)
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
    set_review
  end

  def update
    set_review
    if @review.update
      redirect_to @review
    else
      render :edit
    end
  end

  def destroy
    set_review
    @review.destroy
    redirect_to @ride
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def reviews_params
    params.require(:review).permit(:title, :rating, :content, :ride_id, :user_id)
  end


end
