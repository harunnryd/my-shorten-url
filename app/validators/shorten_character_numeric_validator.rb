class ShortenCharacterNumericValidator < ActiveModel::Validator
  VALID_NUM_AND_CHAR_REGEX = /^[A-Za-z0-9]+$/

  def validate(record)
    if record.custom.present?
      record.errors.add(:shorten, "only contains numeric, character") unless (record.shorten =~ VALID_NUM_AND_CHAR_REGEX)
    end
  end
end
