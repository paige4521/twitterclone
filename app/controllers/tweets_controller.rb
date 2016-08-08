class TweetsController < ApplicationController

  def create
    #read up on .build and .new method differences
    @tweet = current_user.tweets.build(tweet_params)
      if @tweet.save
        flash[:success] = "Your tweet was created successfully"
        redirect_to root_url
      else
        flash[:danger] = "You are not allowed to create this post"
      end
  end

  def index
    @tweet = Tweet.all

  end

  def destroy
      @tweet = Tweet.find(params[:id])
      @tweet.destroy
     redirect_to root_url
  end

  private
  def tweet_params
    params.require(:tweet).permit(:note) #removed :password_digest
  end
end
