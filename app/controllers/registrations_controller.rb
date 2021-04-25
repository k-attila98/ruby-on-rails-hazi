class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            # session cookie beállítás, innen lehet nézni hogy be van e jelentkezve
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Sikeres regisztráció!"
        else
            render :'registrations/new'
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end
