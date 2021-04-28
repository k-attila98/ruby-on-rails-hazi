class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Sikeres bejelentkezés!"
        else
            flash.now[:alert] = "Hibás bejelentkezési adatok!"
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Sikeres kijelentkezés"
    end

    def lost_password
        user = User.find_by(email: params[:email])

        if user.present?
            puts user[:password]
            redirect_to login_path
        end
    end

end
