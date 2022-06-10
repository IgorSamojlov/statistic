class TypeIssuesController < ApplicationController
  before_action :set_type_issue, only: %i[ show edit update destroy ]

  def index
    @type_issues = TypeIssue.all.page(params[:page])
  end

  def show
  end

  def new
    @type_issue = TypeIssue.new
  end

  def edit
  end

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

  def destroy
    @type_issue.destroy

    respond_to do |format|
      format.html { redirect_to type_issues_url, notice: "Type issue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_type_issue
      @type_issue = TypeIssue.find(params[:id])
    end

    def type_issue_params
      params.require(:type_issue).permit(:name)
    end
end
