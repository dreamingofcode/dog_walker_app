class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end 

    def new
        @review = Review.new 
    end 

    def create 
        @review = Review.new
        @walker = Walker.find(params['review']['walker_id'])
        @review.user = User.find(session[:id])
        @review.walker = @walker
        @review.date = params['review']['date']
        @review.user_id = session[:id]
        @review.save
        # byebug
        redirect_to reviews_path(@review)
    end

end