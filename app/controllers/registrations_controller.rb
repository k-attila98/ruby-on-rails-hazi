class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end

    def create

        if User.exists?(user_params[:email])
            redirect_to register_path, alert: "Már regisztráltak ezzel az e-maillel!"
        else
            @user = User.new(user_params)
            if @user.save
                # session cookie beállítás, innen lehet nézni hogy be van e jelentkezve
                session[:user_id] = @user.id
                redirect_to root_path, notice: "Sikeres regisztráció!"
            else
                render :'registrations/new'
            end
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end
