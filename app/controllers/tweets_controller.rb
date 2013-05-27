require 'resque'
require 'resque_scheduler'
require 'resque/scheduler'
class TweetsController < ApplicationController
  Resque.redis='192.168.1.4:6379'
  before_filter :find_tweet, :only => [:show,:edit,:update,:destroy]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(params[:tweet])
    if @tweet.save
      Resque.enqueue_at(@tweet.post_at, SendToTwitter, @tweet.id)
      flash[:notice]="You created a new Tweet."
      redirect_to @tweet
    else
      flash[:alert]="Could not create Tweet."
      render :action => "new"
    end
  end

  def show
    #
  end

private
  
  def find_tweet 
    @tweet = Tweet.find(params[:id])  
  end
end
