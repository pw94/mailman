module MainHelper
    require 'net/http'
    def stats
        uri = URI("https://api.sendgrid.com/v3/stats")
        params = { :aggregated_by => "week", :start_date => 2.weeks.ago.at_beginning_of_week.strftime("%F") }
        uri.query = URI.encode_www_form(params)

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(uri)
        raise 'Environmental variable SENDGRID_API_KEY not found!' if ENV["SENDGRID_API_KEY"].nil?
        request["authorization"] = "Bearer #{ENV["SENDGRID_API_KEY"]}"
        request.body = "{}"

        response = http.request(request)
        response_body = JSON.parse(response.read_body)
        result = {}
        response_body.each do |week|
            metrics = week["stats"][0]["metrics"]
            result[week["date"]] = metrics.slice("requests", "delivered")
        end

        return result
    end
end
