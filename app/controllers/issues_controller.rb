class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  before_filter :authorize
  helper_method :sort_column, :sort_direction

  def index
    @openissues = Issue.all.open
    @closedissues = Issue.all.closed
  end

  def show
  end

  def new
    @issue = Issue.new
  end

   def edit
  end

  def create
    @issue = Issue.new(issue_params)

    if @issue.save
        flash[:success] =  "Issue was successfully Logged" 
        redirect_to issues_path
      else
        flash[:error] =  "Something went horribly wrong. The irony is not lost here" 
        render :new
      end
  end

  def update
      if @issue.update(issue_params)
        flash[:success] =  "Issue was successfully Updated" 
        redirect_to issue_path(@issue)
      else
        flash[:error] =  "Something went horribly wrong. The irony is not lost here" 
        redirect_to issues_path
      end
  end

  def destroy
    @issue.destroy
        flash[:success] =  "This issue has been removed" 
        redirect_to issues_path
  end

  private
    def set_issue
      @issue = Issue.find(params[:id])
    end

    def issue_params
      params.require(:issue).permit(:name, :description, :url, :submitted_by, :status, :resolution_date)
    end

    def sort_column
        Site.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
  
    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
