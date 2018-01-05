module ShortenService
  class Decode

    def self.call(url)
      new(url).call
    end

    def self.method_missing(name, *args)
      result = "Undefined method :#{name} "
      result.concat("with arguments: #{args.join(',')}") if args.present?
      LogService::Create.call(:error, result, 'error_services.log')
      puts "#{result}"
    end

    def call
      num = 0
      url.each_char { |c| num = num * BASE + CHARS.index(c) }
      num
    end

    private
      CHARS = ['a'.upto('z'), 'A'.upto('Z'), '0'.upto('9')].map(&:to_a).flatten!
      BASE = CHARS.length # 62
      def initialize(url)
        @url = url
      end

      attr_reader(:url)
  end
end
