class UsersController < ApplicationController
	def new
		if current_user==nil
			@user=User.new
		else
			puts current_user
			redirect_to user_path(:id => current_user.id)
		end
	end

	def create
    @user = User.new(user_params)
    if @user.save
      login_url @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
  	@user=User.find(params[:id])
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
