module Adapters
  class PinterestAdapter
    def self.decode_pins(encoded_pins_json)
      encoded_pins = JSON.parse(encoded_pins_json).to_h.deep_symbolize_keys

      puts encoded_pins[:data][0][:image][:original][:url]

      encoded_pins[:data].map do |encoded_pin|
        Pin.new(note: encoded_pin[:note], url: encoded_pin[:url], image: encoded_pin[:image][:original][:url])
      end
    end
  end
end