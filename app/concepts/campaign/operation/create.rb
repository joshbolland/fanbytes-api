class Campaign < ActiveRecord::Base
  class Create < Trailblazer::Operation
    extend Contract::DSL

    contract do
      property :title
      property :start_date
      property :budget
      property :brief

      validates :title, presence: true
      validates :start_date, presence: true, in_future: true
      validates :budget, presence: true
      validates :brief, presence: true
    end

    step Model(Campaign, :new)
    step Contract::Build()
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
end
