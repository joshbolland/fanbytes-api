require_relative "../contract/create"

class Campaign::Create < Trailblazer::Operation
  step Model(Campaign, :new)
  step Contract::Build(constant: Campaign::Contract::Create)
  step Contract::Validate(key: :campaign)
  step :persist!
  step :notify!

  def authorize!(options, current_user:, **)
    current_user.signed_in?
  end

  def persist!(options, params:, model:, **)
    model.save
  end

  def notify!(options, current_user:, model:, **)
    Campaign::Notification.(current_user, model)
  end
end
