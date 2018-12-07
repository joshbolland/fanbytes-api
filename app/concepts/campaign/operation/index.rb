class Campaign < ActiveRecord::Base
  class Index < Trailblazer::Operation
    step :model!

    def model!(options, *)
      options["model"] = ::Campaign.all.reverse_order
    end
  end
end
