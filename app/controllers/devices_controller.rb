class DevicesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :admin_user,     only: [:new, :create, :destroy]

  def index
    @devices = Device.paginate(page: params[:page])
  end

  def show
    @device = Device.find(params[:id])
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      flash[:info] = "Device Added"
      redirect_to @device
    else
      render 'new'
    end
  end

  def edit
    @device = Device.find(params[:id])
  end

  def update
    @device = Device.find(params[:id])
    if @device.update_attributes(device_params)
      flash[:success] = "Device updated"
      redirect_to :back
    else
      flash[:error] = "Devive not updated - Something went wrong"
    end
  end



  def destroy
  end

  private
    def device_params
      params.permit(:name, :status, :user_id)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end