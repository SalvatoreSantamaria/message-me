class ChatroomController < ApplicationController
    before_action :require_user
    
    def index
        #need to grab messages in an instance variable
        @messages = Message.all
    end

end
