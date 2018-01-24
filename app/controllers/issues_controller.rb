class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :update, :destroy]

  # GET /issues
  def index
    @hot = Issue.hot
    @new = Issue.newest
    @top = Issue.top
    @front = {top: @top, hot: @hot, new: @new}
    render json: @front
  end

  # GET /issues/1
  def show
    render json: @issue
  end

  # POST /issues
  def create
    # byebug
    @issue = Issue.new(issue_params)

    if @issue.save
      render json: @issue, status: :created, location: @issue
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /issues/1
  def update
    if @issue.update(issue_params)
      render json: @issue
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end

  # DELETE /issues/1
  def destroy
    @issue.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def issue_params
      params.require(:issue).permit(:creator_id, :title, :category)
    end
end
