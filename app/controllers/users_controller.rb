class UsersController < ApplicationController
  # app/controllers/users_controller.rb
  def create
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])

    if @user.save
      redirect_to new_users_path
    else
    render :new, status: :unprocessable_entity
    end
  end


  def new
  end
end
