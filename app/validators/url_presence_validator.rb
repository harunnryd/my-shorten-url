class UrlPresenceValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:url, "can't be blank") unless record.url.present?
  end
end
