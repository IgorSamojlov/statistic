class TypeIssuesController < ApplicationController
  before_action :set_type_issue, only: %i[ show edit update destroy ]

  # GET /type_issues or /type_issues.json
  def index
    @type_issues = TypeIssue.all
  end

  # GET /type_issues/1 or /type_issues/1.json
  def show
  end

  # GET /type_issues/new
  def new
    @type_issue = TypeIssue.new
  end

  # GET /type_issues/1/edit
  def edit
  end

  # POST /type_issues or /type_issues.json
  def create
    @type_issue = TypeIssue.new(type_issue_params)

    respond_to do |format|
      if @type_issue.save
        format.html { redirect_to type_issue_url(@type_issue), notice: "Type issue was successfully created." }
        format.json { render :show, status: :created, location: @type_issue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @type_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_issues/1 or /type_issues/1.json
  def update
    respond_to do |format|
      if @type_issue.update(type_issue_params)
        format.html { redirect_to type_issue_url(@type_issue), notice: "Type issue was successfully updated." }
        format.json { render :show, status: :ok, location: @type_issue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @type_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_issues/1 or /type_issues/1.json
  def destroy
    @type_issue.destroy

    respond_to do |format|
      format.html { redirect_to type_issues_url, notice: "Type issue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_issue
      @type_issue = TypeIssue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_issue_params
      params.fetch(:type_issue, {})
    end
end
