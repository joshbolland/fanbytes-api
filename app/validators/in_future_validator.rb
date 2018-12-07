class InFutureValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "must be in the future") if value <= Time.zone.today
  end
end
