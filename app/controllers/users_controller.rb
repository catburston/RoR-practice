class UsersController < ApplicationController
  def index
    @users = User.last_created(10)
    render 'not_found', status:404 unless @users
  end

  def show
    @user = User.find_by(id: params[:id])
    render 'not_found', status:404 unless @user
  end

  def new
    @user = User.new
    render 'new'
  end

  def create
    @user = User.new user_params
    #@visit.user = User.find(session[:user_id])

    if @user.save
      flash[:notice] = "User created"
      redirect_to action: 'index', controller: 'users'
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User deleted"
    redirect_to action: 'index'
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes user_params
      flash[:notice] = "User updated"
      redirect_to action: 'show', controller: 'users', id: @user.id
    else
      flash[:error] = "User not updated"
      @errors = user.errors.full_messages
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:user_name, :user_firstname, :user_lastname)
    end
end
