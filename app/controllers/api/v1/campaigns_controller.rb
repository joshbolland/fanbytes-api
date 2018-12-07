class Api::V1::CampaignsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [:index, :show]
  before_action :set_campaign, only: [:show, :update, :destroy]

  def index
    @campaign = Campaign.all
  end

  def show
  end

  def update
    if @campaign.update(campaign_params)
      render :show
    else
      render_error
    end
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user = current_user
    if @campaign.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @campaign.destroy
    head :no_content
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:title, :start_date, :budget, :brief)
  end

  def render_error
    render json: { errors: @campaign.errors.full_messages }, status: :unprocessable_entity
  end
end
