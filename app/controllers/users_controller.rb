class UsersController < ApplicationController
  load_and_authorize_resource

  # GET /users
  def index
    if current_user.admin?
      @users = User.all
    else
      redirect_to root_path, alert: "You are not authorized to view this page."
    end
  end

  # GET /users/1
  def show
    unless current_user.admin? || current_user == @user
      redirect_to root_path, alert: "You are not authorized to view this page."
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    unless current_user.admin? || current_user == @user
      redirect_to root_path, alert: "You are not authorized to edit this profile."
    end
  end

  # POST /users
  def create
    @user.role = Role.find(params[:user][:role_id]) # Assign the selected role
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    if @user.orders.any?
      redirect_to users_url, alert: "Couldn't delete user as there are pending orders."
    else
      if @user.destroy
        redirect_to users_url, notice: 'User was successfully destroyed.'
      else
        redirect_to users_url, notice: "User could not be removed: #{@user.errors.full_messages.join(', ')}"
      end
    end
  rescue StandardError => e
    redirect_to users_url, alert: "An error occurred while trying to delete the user."
  end

  private

  def user_params
    permitted_params = [:city_id, :full_name, :email, :cell_number, :password, :password_confirmation, :role_id]
    params.require(:user).permit(permitted_params)
  end
end
