class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:show, :edit, :update]
  # GET /users
  # GET /users.json
  # User should not be allowed to view all other users
  # def index
  #   @users = User.all
  # end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.paginate(page: params[:page])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = "Welcome #{@user.name}!"
      redirect_back_or @user
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :address, :password_digest, :cc_number, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
