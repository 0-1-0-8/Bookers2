class UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :colect_user, only: [:edit, :update]

  def show
  	  @user = User.find(params[:id])
  	  @book = Book.new
  	  @books = @user.books
  end
  def update
  	  @user = User.find(params[:id])
  	  if @user.update(user_params)
  	     flash[:notice] = "You have updated user successfully."
  	     redirect_to user_path(@user.id)
  	  else
  	  	@users = User.all
  	  	render action: :edit
  	  end
  end
  def index
  	  @users = User.all
  	  @book = Book.new
  end
  def new
  	  @user = Book.new
  	  @user = User.new
  end

  def edit
  end

  def create
  	  @user = User.new(user_params)
  	  @user.save
  	  flash[:notice] = "Welcome! You have signed up successfully."
  	  redirect_to @user
  end

    private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end

	def colect_user
	 @user = User.find(params[:id])
 	 if @user.id != current_user.id
 	    redirect_to user_path(current_user)
 	 end
    end
end
