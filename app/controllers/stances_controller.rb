class StancesController < ApplicationController
  before_action :set_stance, only: [:show, :update, :destroy]

  # GET /stances
  def index
    @stances = Stance.all

    render json: @stances
  end

  # GET /stances/1
  def show
    render json: @stance
  end

  # POST /stances
  def create
    @stance = Stance.new(stance_params)

    old = @stance.user.stances.find{|s| s.issue.id == @stance.issue.id}

    if old
      old.update(view_id: @stance.view.id, importance: stance_params[:importance])
      @stance = old
    end
    # @stance.user.stances.destroy(old)
    # @stance.user.save
    # puts @stance.user.stances
    if @stance.save
      # @stance.user.save
      puts UserSerializer.new(@stance.user).attributes
      @new_user = User.find(@stance.user.id)
      render json: { issue: IssueSerializer.new(@stance.issue).attributes, user: UserSerializer.new(@new_user).attributes}, status: :created
    else
      render json: @stance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stances/1
  def update
    if @stance.update(stance_params)
      render json: @stance
    else
      render json: @stance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stances/1
  def destroy
    @stance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stance
      @stance = Stance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stance_params
      params.require(:stance).permit(:user_id, :view_id, :importance)
    end
end
