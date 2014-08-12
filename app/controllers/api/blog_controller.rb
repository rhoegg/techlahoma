class Api::BlogController < ApplicationController

  def feed
    blogroll = BlogRoll.pluck(:feed_uri)#.all
    render :json => blogroll, status: 200
  end
  
  def feed
    blogroll = BlogRoll.pluck(:feed_uri)#.all
    render :json => blogroll, status: 200
  end
  
end
