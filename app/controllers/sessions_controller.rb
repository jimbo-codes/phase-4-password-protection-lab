class SessionsController < ApplicationController
        def create
        @user = User.find_by_username(params[:username])
        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            # debugger
            # you used to send back user Id and pass that through your app, dont need
            render json: @user, status: 201
        else
            render json: {error: "Invalid Username or Password."}, status: 401
        end
    end 
end