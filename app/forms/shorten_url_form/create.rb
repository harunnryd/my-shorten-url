module ShortenUrlForm
  class Create
    include ActiveModel::Model
    attr_accessor(:url, :shorten, :custom)

    private
      validates_with ShortenPresenceValidator
      validates_with ShortenCharacterNumericValidator
      validates_with ShortenUniquenessValidator
      validates_with UrlPresenceValidator
      validates_with UrlHttpValidator
      validates_with UrlUniquenessValidator
  end
end
