# class MessagesController < ApplicationController
# before_action :require_user 

# def create
#     message = current_user.messages.build(message_params) #create message using current user. .build create association between current_user and the message automatically. 
#     if message.save
#         redirect_to root_path
#     end
# end

# private

# def message_params
#     params.require(:message).permit(:body) #whitelisting message_params
# end

# end

class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast "chatroom_channel", mod_message: message_render(message) #broadcast message to 'chatroom_channel' takes hash. key is mod_message, value is .message_render(), which is a function that takes in the message object 
      # redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial: 'message', locals: {message: message}) #render message partial, and use the message (message.save) from the create action above. 
  end

end