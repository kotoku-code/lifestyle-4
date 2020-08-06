class UsersController < ApplicationController
<<<<<<< HEAD
    
end
=======
    before_action :prevent_logged_in_user_access
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
  
      if @user.save
        login(@user)
        redirect_to root_path, notice: 'Logged in'
      else
        render :new
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :password)
    end
  end
>>>>>>> 67e9149bc9b893837e66bdb8225facd2d838ad54
