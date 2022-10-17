class RequestHandler
    attr_accessor :options

    def initialize(url)
        @options = {}

        @options[:url] = url
        @options[:body] = {}
        @options[:headers] = {:"Content-Type" => "application/json"}
        @options[:method]  = 'get'
        @options[:path]    = ''
    end

    def execute_request
        opt = @options
        response = HTTParty.send(opt[:method], 
                                (opt[:url] + opt[:path]), opt)

        begin
            response_body = JSON.parse(response.body)
        rescue JSON::ParserError => _
            response_body = response.body
        end

        return {
            :response => response_body,
            :status => response.code,
            :headers => response.headers,
            :request_headers => response.request.options['headers']
        }
    end
end