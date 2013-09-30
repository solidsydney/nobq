class MessagesController < ApplicationController

  before_filter :load_picture
  def new
    @message = @picture.messages.new(:parent_id => params[:parent_id])
  end

  def create
    @message = @picture.messages.new(params[:message])
    if @message.save
      redirect_to @picture, :notice => 'Thanks for your comment'
    else
      redirect_to @picture, :alert => 'Unable to add comment'
    end
  end

  def destroy
    @message = @picture.messages.find(params[:id])
    @message.destroy
    redirect_to @picture, :notice => 'Comment deleted'
  end
  private
  def load_picture
    @picture = Picture.find(params[:picture_id])
  end

end
