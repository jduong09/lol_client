class MessagesController < ApplicationController
  def create
    @receiver = User.find_by(username: params['message']['receiver_name'])
    @message = Message.new({ 
      body: params['message']['body'], 
      receiver_id: @receiver.id,
      sender_id: params[:user_id]
    })

    if @message.save
      
    else
      render @message.errors.full_messages
    end
  end

  private

  def message_params
    params.require(:message).permit(:receiver_name, :body)
  end

end