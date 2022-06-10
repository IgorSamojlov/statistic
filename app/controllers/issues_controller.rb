class IssuesController < ApplicationController
  before_action :set_issue, only: %i[ show edit update destroy ]

  def index
    @issues = Issue.includes(
      :project,
      :tags,
      :type_issue,
      :employee,
      :state_issue,
      :priority_issue
    ).
    all.
    page(params[:page])
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

    respond_to do |format|
      if @issue.save
        format.html { redirect_to issue_url(@issue), notice: "Issue was successfully created." }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to issue_url(@issue), notice: "Issue was successfully updated." }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to issues_url, notice: "Issue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_issue
      @issue = Issue.find(params[:id])
    end

    def issue_params
      params.require(:issue).permit(
       :project_id,
       :employee_id,
       :priority_issue_id,
       :state_issue_id,
       :type_issue_id,
       :summary,
       :date_start_dev,
       :date_end_dev,
       :date_start_test,
       :date_end_test,
       tag_ids: []
      )
    end
end
