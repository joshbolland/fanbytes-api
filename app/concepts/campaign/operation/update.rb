class Campaign < ActiveRecord::Base
  class Update < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Campaign, :find_by)
      step Contract::Build( constant: Campaign::Contract::Create )
    end

    step Nested(Present)
    step Contract::Validate( key: :blog_post )
    step Contract::Persist()
  end
end
