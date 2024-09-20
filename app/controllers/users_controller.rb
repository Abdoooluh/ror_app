class UsersController < ApplicationController
  load_and_authorize_resource

  # GET /users
  def index
    # Admins can see all users, other users should not have access to this action
  end

  # GET /users/1
  def show
    # Users can only see their own profile or if they're an admin
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    # Users can only edit their own profile
  end

  # POST /users
  def create
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
      redirect_to users_url, alert: "Couldn't delete user as there are pending orders"
    else
      if @user.destroy
        redirect_to users_url, notice: 'User was successfully destroyed.'
      else
        redirect_to users_url, notice: "User Could Not be removed #{@user.errors}"
      end
    end
  rescue StandardError => e
    redirect_to users_url, alert: "An error occurred while trying to delete the user."
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:city_id, :full_name, :email, :cell_number, :password, :password_confirmation)
  end
end
