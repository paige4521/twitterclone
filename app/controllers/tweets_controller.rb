class TweetsController < ApplicationController

  def create
    @tweet = current_user.tweets.build(tweet_params)
      if @tweet.save
        flash[:success] = "Your tweet was created successfully"
        redirect_to root_url
      else
        flash[:danger] = "You are not allowed to create this post"
      end


  end

  private
  def tweet_params
    params.require(:tweet).permit(:note) #removed :password_digest
  end
end
