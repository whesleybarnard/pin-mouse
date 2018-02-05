# puts 'setting up the mocking'
Rails.logger.info "setting up the mocking"

require 'webmock'
include WebMock::API

WebMock.enable!

WebMock.after_request do |req, response|
    request = {
        uri: req.uri.to_s,
        method: req.method.to_s.upcase,
        headers: req.headers,
        body: req.body
    }
    puts request.inspect
end

stub_request(:any, /api.pinterest.com/).
    to_return(:body => {data: 'some data...'}.to_json, :status => 200)

# stub_request(:get, 'http://host/api').to_return(:body => 'fake body')
stub_request(:any, /api.pinterest.com\/v1\/pins\//).
    # to_return(status: [500, "Internal Server Error"])
    to_return(:body => File.read('test/mock/pinterestResource_retrieve_pin_info.json'), :status => 200)
