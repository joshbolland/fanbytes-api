class Campaign < ActiveRecord::Base
  class Show < Trailblazer::Operation
    step Model(Campaign, :find_by)
  end
end
