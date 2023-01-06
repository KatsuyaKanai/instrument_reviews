class MessagesController < ApplicationController

  def index
    @message = Message.new
  end

  def confirm
    @message = Message.new(message_params)
    if @message.valid?
      render :action => 'confirm'
    else
      render :action => 'index'
    end
  end

  def done
    @message = Message.new(message_params)
    if @message.valid?
      MessageMailer.received_email(@message).deliver_now
      render :action => 'done'
    else
      render :action => 'index'
    end
  end

  private
  def message_params
    params.require(:message).permit(:name, :email, :genre, :content)
  end
end
