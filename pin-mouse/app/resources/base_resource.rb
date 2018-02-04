class BaseResource
  def self.call_api(method, url, valid_codes, body = nil)
    Rails.logger.info "Trying to call: #{url}"
    # response = HTTParty.send(method, url, :body => body, :debug_output => $stdout)
    response = HTTParty.send(method, url, :body => body)

    validate_response(response, valid_codes)

    response
  end

  private

  def self.validate_response(response, valid_codes)
    raise RuntimeError.new("Invalid HTTP response code: #{response.code}") unless valid_codes.include?(response.code)
  end

end