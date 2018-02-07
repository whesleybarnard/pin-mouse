class BaseResource
  def self.call_api(method, url, valid_codes, body = nil)
    Rails.logger.info "Trying to call: #{method} #{url}"
    # response = HTTParty.send(method, url, :body => body, :debug_output => $stdout)
    response = HTTParty.send(method, url, :body => body)

    validate_response(response, valid_codes)

    response
  end

  private

  def self.validate_response(response, valid_codes)
    unless valid_codes.include?(response.code)
      msg = "Invalid HTTP response code: #{response.code} required #{valid_codes}"
      Rails.logger.error msg
      raise RuntimeError.new(msg)
    end
  end

end