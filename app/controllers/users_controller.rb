class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def show
        if session[:user_id] && session[:user_id] == User.find(params[:id]).id
            @user = User.find(session[:user_id])
        else
            redirect_to root_path, notice: "Ehhez a művelethez nincs jogosultságod!"
        end

    end

    def edit
        if session[:user_id] && session[:user_id] == User.find(params[:id]).id
            @user = User.find(params[:id])
        else
            redirect_to root_path, notice: "Ehhez a művelethez nincs jogosultságod!"
        end
    end

    def update
        if session[:user_id]
            @user = User.find(params[:id])

            if @user.update(user_edit_params)
                redirect_to @user
            else
                render :edit
            end
        else
            redirect_to root_path, notice: "Ehhez a művelethez nincs jogosultságod!"
        end
    end

    def create

        if User.exists?(user_params[:email])
            redirect_to register_path, alert: "Már regisztráltak ezzel az e-maillel!"
        else
            @user = User.new(user_params)
            if @user.save
                # session cookie beállítás, innen lehet nézni hogy be van e jelentkezve
                # session[:user_id] = @user.id
                redirect_to login_path, notice: "Sikeres regisztráció!"
            else
                render :'users/new'
            end
        end
    end

    def lost_password
        user = User.find_by(email: params[:email])
        if user.present?
            puts(user[:password_digest])
            redirect_to login_path, notice: "A jelszó hash a terminálon van!"
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end

    def user_edit_params
        params.require(:user).permit(:email, :name)
    end


end
