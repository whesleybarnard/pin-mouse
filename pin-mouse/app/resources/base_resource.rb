class BaseResource
  def self.call_api(method, url, codes, body = nil)
    Rails.logger.info "Trying to call: #{url}"
    response = HTTParty.send(method, url)

    validate_response(response, codes)

    response
  end

  private

  def self.validate_response(response, codes)
    raise RuntimeError.new("Invalid HTTP response code: #{response.code}") unless codes.include?(response.code)
  end

end