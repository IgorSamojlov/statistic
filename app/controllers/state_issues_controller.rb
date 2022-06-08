class StateIssuesController < ApplicationController
  before_action :set_state_issue, only: %i[ show edit update destroy ]

  # GET /state_issues or /state_issues.json
  def index
    @state_issues = StateIssue.all
  end

  # GET /state_issues/1 or /state_issues/1.json
  def show
  end

  # GET /state_issues/new
  def new
    @state_issue = StateIssue.new
  end

  # GET /state_issues/1/edit
  def edit
  end

  # POST /state_issues or /state_issues.json
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

  # PATCH/PUT /state_issues/1 or /state_issues/1.json
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

  # DELETE /state_issues/1 or /state_issues/1.json
  def destroy
    @state_issue.destroy

    respond_to do |format|
      format.html { redirect_to state_issues_url, notice: "State issue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state_issue
      @state_issue = StateIssue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def state_issue_params
      params.fetch(:state_issue, {})
    end
end
