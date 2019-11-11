class ChatroomController < ApplicationController
    
    def index
        #need to grab messages in an instance variable
        @messages = Message.all
    end

end
