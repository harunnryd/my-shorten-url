module LogService
  class Create
    def self.call(stat, msg, location)
      new(stat, msg, location).call
    end

    def self.method_missing(name, *args)
      result = "Undefined method :#{name} "
      result.concat("with arguments: #{args.join(',')}") if args.present?
      self.call(:error, result, 'error_services.log')
      puts "#{result}"
    end

    def call
      log ||= Logger.new("#{Rails.root}/log/#{location}")
      log.send(stat) do
        msg
      end
    end

    private
      def initialize(stat, msg, location)
        @stat = stat
        @msg = msg
        @location = location
      end

      attr_reader(:stat, :msg, :location)
  end
end
