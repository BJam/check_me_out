class DevicesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :admin_user,     only: [:new, :create, :destroy]

  def index
    @devices = Device.paginate(page: params[:page])
  end

  def show
    @device = Device.find(params[:id])
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
      flash[:error] = "Something went wrong"
    end
  end

  def create
  end

  def destroy
  end

  private
    def device_params
      params.permit(:name, :status, :user_id)
    end

end