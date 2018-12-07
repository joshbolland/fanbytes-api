class Campaign < ActiveRecord::Base
  class Index < Trailblazer::Operation
    step :model!

    def model!(options, *)
      options["model"] = ::Campaign.all
    end
  end
end
