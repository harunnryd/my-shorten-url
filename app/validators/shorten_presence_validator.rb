class ShortenPresenceValidator < ActiveModel::Validator
  def validate(record)
    if record.custom.present?
      record.errors.add(:shorten, "can't be blank") unless record.shorten.present?
    end
  end
end
