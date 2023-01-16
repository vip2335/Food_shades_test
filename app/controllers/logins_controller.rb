
class LoginsController < ApplicationController
    def new
      @user = User.new
    end 

    def create
   
        @user = User.find_by(email: user_params[:email])
        if @user && @user.authenticate(user_params[:password])
            session[:user_id] = @user.id 
            redirect_to '/restaurants'
        else
          flash.now[:notice] = "Invlaid user and password"
          render :new
      end
    end 
    def destroy
      session[:user_id] = nil
      redirect_to restaurants_path
    end
    
end
 
def user_params
  params.require(:user).permit(:email, :password)
end
