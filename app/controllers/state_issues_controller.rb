class StateIssuesController < ApplicationController
  before_action :set_state_issue, only: %i[ show edit update destroy ]

  def index
    @state_issues = StateIssue.all.page(params[:page])
  end

  def show
  end

  def new
    @state_issue = StateIssue.new
  end

  def edit
  end

  def create
    @state_issue = StateIssue.new(state_issue_params)

    respond_to do |format|
      if @state_issue.save
        format.html { redirect_to state_issue_url(@state_issue), notice: "State issue was successfully created." }
        format.json { render :show, status: :created, location: @state_issue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @state_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @state_issue.update(state_issue_params)
        format.html { redirect_to state_issue_url(@state_issue), notice: "State issue was successfully updated." }
        format.json { render :show, status: :ok, location: @state_issue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @state_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @state_issue.destroy

    respond_to do |format|
      format.html { redirect_to state_issues_url, notice: "State issue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_state_issue
      @state_issue = StateIssue.find(params[:id])
    end

    def state_issue_params
      params.require(:state_issue).permit(:name)
    end
end
