class UsersController < ApplicationController
  def show
   @user = current_user
   # @user = User.find(params[:id])
   @books =@user.books
  end

  def edit
   @user = User.find(params[:id])
   if @book.user == current_user
   render "edit"
   else
   redirect_to books_path
   end
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
   redirect_to user_path, notice: 'You have updated user successfully.'
   else
   render :edit
   end
  end

  private

  def user_params
   params.require(:user).permit(:name, :profile_image, :introduction)
  end
end