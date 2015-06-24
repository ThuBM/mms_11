class Admin::UsersController < Admin::AdminController
  before_action :getUser, only: [:update, :show]

  def index
    @users = User.paginate page: params[:page],
                           per_page: Settings.user.users_number_per_page
  end

  def show
    @team = @user.teams.last
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.save
      render json: @user
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      render json: @user
    else
      render "edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    head :no_content
  end

  private
  def user_params
    params.require(:user).permit :name, :role
  end

  def getUser
    @user = User.find params[:id]
  end
end
