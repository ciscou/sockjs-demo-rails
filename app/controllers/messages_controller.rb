class MessagesController < ApplicationController
  def index
  end

  def create
    @message = Message.new(params[:message])
    @message.save
  end
end
