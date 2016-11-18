class LicensesController < ApplicationController
  before_action :set_license, only: [:show, :edit, :update, :destroy]

  def index
    @licenses = License.all
  end

  def show
  end

  def new
    @license = License.new
  end

  def edit
  end

  def create
    @license = License.new(license_params)
      if @license.save
        flash[:success] =  "License was successfully created" 
        redirect_to licenses_path
      else
        flash[:error] =  "Something went horribly wrong. We will look into that" 
        render :new
      end
  end

  def update
      if @license.update(license_params)
        flash[:success]=  "License was successfully Updated" 
        redirect_to licenses_path
      else
        flash[:error] =  "Something went horribly wrong. We will look into that" 
      end
  end

  def destroy
    @license.destroy
      flash[:success] =  "License was successfully Deleted" 
      redirect_to licenses_path
  end

  private
    def set_license
      @license = License.find(params[:id])
    end

    def license_params
      params.require(:license).permit(:name)
    end
end
