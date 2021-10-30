class MessagesController < ApplicationController
  def index
    @messages = params[:friend_id] ? Message.index_by_friend_id(current_user.id, params[:friend_id]) : [];
    puts @messages
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace(:messages, partial: "messages/messages", locals: { messages: @messages }) }
      format.html { render :index }
    end
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
        format.turbo_stream { render turbo_stream: turbo_stream.append(:messages, partial: "messages/message", locals: { message: @message })}
        format.html { redirect_to user_messages_url(params[:user_id]) }
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