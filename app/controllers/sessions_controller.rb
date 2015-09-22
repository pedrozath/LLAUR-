class SessionsController < ApplicationController
    def create
        if params[:user]["pass"] == ENV["PASS"]
            session[:pass] = params[:user]["pass"]
            redirect_to "/"
        else
            flash[:notice] = "errou!"
            render :new
        end
    end

    def destroy
        session.delete :pass
        redirect_to "/"
    end
end
