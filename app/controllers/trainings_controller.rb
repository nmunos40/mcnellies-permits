class TrainingsController < ApplicationController
  before_action :set_training, only: [:edit, :update, :destroy]
  before_filter :authorize

  def index
    @trainings = Training.all
  end


  def new
    @training = Training.new
  end

  def edit
  end

  def create
    @training = Training.new(training_params)

      if @training.save
        flash[:success] =  "License was successfully created" 
        redirect_to trainings_path
      else
        flash[:error] =  "Something went horribly wrong. We will look into that" 
        render :new
      end
  end


  def update
      if @training.update(training_params)
        flash[:success]=  "License was successfully Updated" 
        redirect_to trainings_path
      else
        flash[:error] =  "Something went horribly wrong. We will look into that" 
      end
  end

  def destroy
    @training.destroy
      flash[:success] =  "Training item was successfully Deleted" 
      redirect_to trainings_path
  end

  private
    def set_training
      @training = Training.find(params[:id])
    end

    def training_params
      params.require(:training).permit(:course_name)
    end
end
