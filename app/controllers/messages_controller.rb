class MessagesController < ApplicationController
  def index
    @messages = Message.index_by_friend_id(current_user.id, 2)

    render :index
  end

  def create
    @receiver = User.find_by(username: params['message']['receiver_name'])
    @message = Message.new({ 
      body: params['message']['body'], 
      receiver_id: @receiver.id,
      sender_id: params[:user_id]
    })

    if @message.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:message, partial: "messages/message",
            locals: { message: @message })
        end
      end
    else
      render @message.errors.full_messages
    end
  end

  private

  def message_params
    params.require(:message).permit(:receiver_name, :body)
  end

end