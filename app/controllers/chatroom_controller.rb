class ChatroomController < ApplicationController
    before_action :require_user
    
    def index
        @message = Message.new
        # @messages = Message.all #this is to grab all the messages
        @messages = Message.custom_display #see the model for the custom_display method
    end


end
