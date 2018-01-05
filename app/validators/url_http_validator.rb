class UrlHttpValidator < ActiveModel::Validator
  VALID_URL = URI.regexp %w{http https}

  def validate(record)
    record.errors.add(:url, "must be contains http or https") unless (record.url =~ VALID_URL)
  end

end
