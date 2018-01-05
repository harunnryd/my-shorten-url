module ShortenUrlService
  class Show
    def self.call(shorten, callbacks)
      new(shorten, callbacks).call
    end

    def self.method_missing(name, *args)
      result = "Undefined method :#{name} "
      result.concat("with arguments: #{args.join(',')}") if args.present?
      LogService::Create.call(:error, result, 'error_services.log')
      puts "#{result}"
    end

    def call
      shorten_url = ShortenUrl.find_by(shorten: shorten)
      return callbacks[:success].call(shorten_url) if shorten_url.present?
      return callbacks[:failure].call
    end

    private
      def initialize(shorten, callbacks)
        @shorten = shorten
        @callbacks = callbacks
      end

      attr_reader(:shorten, :callbacks)
  end
end
