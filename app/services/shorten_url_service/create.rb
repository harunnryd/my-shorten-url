module ShortenUrlService
  class Create
    def self.call(params, callbacks)
      new(params, callbacks).call
    end

    def self.method_missing(name, *args)
      result = "Undefined method :#{name} "
      result.concat("with arguments: #{args.join(',')}") if args.present?
      LogService::Create.call(:error, result, 'error_services.log')
      puts "#{result}"
    end

    def call
      form = ShortenUrlForm::Create.new(params)
      return callbacks[:response].call(form) unless form.valid?
      return callbacks[:response].call(generate(form))
    end


    private
      def initialize(params, callbacks)
        @params = params
        @callbacks = callbacks
      end

      attr_reader(:params, :callbacks)

      def generate(form)
        ShortenUrl.transaction do
          shorten_url = ShortenUrl.create!(url: form.url)
          if form.custom.present?
            shorten_url.shorten = form.shorten
          else
            shorten_url.shorten = ShortenService::Encode.call(shorten_url.id)
          end
          if shorten_url.save!
            return shorten_url
          else
            raise ActiveRecord::Rollback
          end
        end
      end
  end
end
