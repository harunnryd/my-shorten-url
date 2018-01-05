module ShortenService
  class Encode

    def self.call(num)
      new(num).call
    end

    def self.method_missing(name, *args)
      result = "Undefined method :#{name} "
      result.concat("with arguments: #{args.join(',')}") if args.present?
      LogService::Create.call(:error, result, 'error_services.log')
      puts "#{result}"
    end

    def call
      begin
        i = num
        return CHARS[0] if i.equal?(0)
        s = String('')
        loop do
          # --------------------------------------------
          # NOTE : index didapat dari sisa pembagian 62
          # --------------------------------------------
          s.concat(CHARS[i.modulo(BASE)])
          i = i.div(BASE)
          break if i.equal?(0)
        end
        s.reverse! # balik kata
      rescue => e
        puts '[Error] '.concat("#{e}")
      end
    end

    private
      CHARS = ['a'.upto('z'), 'A'.upto('Z'), '0'.upto('9')].map(&:to_a).flatten!
      BASE = CHARS.length # 62

      def initialize(num)
        @num = num
      end


      attr_reader(:num)
  end
end
