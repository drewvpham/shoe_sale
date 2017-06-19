class SessionsController < ApplicationController

  def create
    user=User.find_by(email: login_params[:email])
    if user && user.authenticate(login_params[:password])
      session[:user_id]=user.id
      redirect_to shoes_path
    else
      flash[:login_error]='Invalid credentials'
      redirect_to :root
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end


    private
      def login_params
        params.require(:user).permit(:email, :password)
      end

  end
