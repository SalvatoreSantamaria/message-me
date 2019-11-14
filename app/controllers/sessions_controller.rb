class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "You have logged in" #using semantic class success
            redirect_to root_path
        else   
            flash.now[:error] = "There was something wrong with your login information" #using semantic class error
            render 'new'
        end
    end

    def destroy 
        session[:user_id] = nil
        flash[:success] = "You have logged out"
        redirect_to login_path
    end

end
