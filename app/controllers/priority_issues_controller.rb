class PriorityIssuesController < ApplicationController
  before_action :set_priority_issue, only: %i[ show edit update destroy ]

  def index
    @priority_issues = PriorityIssue.all.page(params[:page])
  end

  def show
  end

  def new
    @priority_issue = PriorityIssue.new
  end

  def edit
  end

  def create
    @priority_issue = PriorityIssue.new(priority_issue_params)

    respond_to do |format|
      if @priority_issue.save
        format.html { redirect_to priority_issue_url(@priority_issue), notice: "Priority issue was successfully created." }
        format.json { render :show, status: :created, location: @priority_issue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @priority_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @priority_issue.update(priority_issue_params)
        format.html { redirect_to priority_issue_url(@priority_issue), notice: "Priority issue was successfully updated." }
        format.json { render :show, status: :ok, location: @priority_issue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @priority_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @priority_issue.destroy

    respond_to do |format|
      format.html { redirect_to priority_issues_url, notice: "Priority issue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_priority_issue
    @priority_issue = PriorityIssue.find(params[:id])
  end

  def priority_issue_params
    params.require(:priority_issue).permit(:name)
  end
end
