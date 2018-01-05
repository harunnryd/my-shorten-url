class ShortenUniquenessValidator < ActiveModel::Validator
  def validate(record)
    if record.custom.present?
      record.errors.add(:shorten, 'url already taken') if ShortenUrl.find_by(shorten: record.shorten).present?
    end
  end
end
