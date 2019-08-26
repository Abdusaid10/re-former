class UsersController < ApplicationController
    def new 
    end
    def create
      @user = User.new(whitelisted_post_params)
    #   @user=User.new(username: params[:username], email: params[:email], password: params[:password])  
      if @user.save
        redirect_to new_user_path
      else
        render :new
      end
    end

    def edit
        @user=User.find(params[:id])
    end

    def update
        @user=User.find(params[:id])
        @user.update(whitelisted_post_params)

    end

    def show
    end

    private
    def whitelisted_post_params
        params.require(:user).permit(:username,:email,:password)
    end
end
