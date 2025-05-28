class UsersController < ApplicationController
  # app/controllers/users_controller.rb
  def create
    @user = User.new(user_params)
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])

    if @user.save
      redirect_to new_users_path
    else
    render :new, status: :unprocessable_entity
    end
  end


  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.expect(user: [ :username, :email, :password ])
  end
end
