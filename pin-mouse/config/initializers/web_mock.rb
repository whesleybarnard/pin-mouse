Rails.logger.warn "setting up mocking for external api calls"

require 'webmock'
include WebMock::API

WebMock.enable!

WebMock.after_request do |req, response|
    Rails.logger.warn "WebMock is in place. Currently mocking response for uri: #{req.uri.to_s}"
end

stub_request(:any, /api.pinterest.com/).
    to_return(:body => {data: 'mocked data...'}.to_json, :status => 404)

stub_request(:get, /api.pinterest.com\/v1\/pins\//).
    to_return(:body => File.read('test/mock/pinterestResource_retrieve_pin_info.json'), :status => 200)

stub_request(:post, /api.pinterest.com\/v1\/pins\//).
    to_return(:body => File.read('test/mock/pinterestResource_retrieve_pin_info.json'), :status => 201)

stub_request(:get, /api.pinterest.com\/v1\/me\/boards\//).
    to_return(:body => File.read('test/mock/pinterestResource_retrieve_boards.json'), :status => 200)
