class PriorityIssuesController < ApplicationController
  before_action :set_priority_issue, only: %i[ show edit update destroy ]

  # GET /priority_issues or /priority_issues.json
  def index
    @priority_issues = PriorityIssue.all
  end

  # GET /priority_issues/1 or /priority_issues/1.json
  def show
  end

  # GET /priority_issues/new
  def new
    @priority_issue = PriorityIssue.new
  end

  # GET /priority_issues/1/edit
  def edit
  end

  # POST /priority_issues or /priority_issues.json
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

  # PATCH/PUT /priority_issues/1 or /priority_issues/1.json
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

  # DELETE /priority_issues/1 or /priority_issues/1.json
  def destroy
    @priority_issue.destroy

    respond_to do |format|
      format.html { redirect_to priority_issues_url, notice: "Priority issue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_priority_issue
      @priority_issue = PriorityIssue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def priority_issue_params
      params.fetch(:priority_issue, {})
    end
end
