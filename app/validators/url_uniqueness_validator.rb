class UrlUniquenessValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:url, 'already registered') if ShortenUrl.find_by(url: record.url).present?
  end
end
