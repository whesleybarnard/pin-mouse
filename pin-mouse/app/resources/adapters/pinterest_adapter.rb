module Adapters
  class PinterestAdapter
    def self.decode_pins(encoded_pins_json)
      encoded_pins = JSON.parse(encoded_pins_json).to_h.deep_symbolize_keys

      puts encoded_pins[:data][0][:image][:original][:url]

      encoded_pins[:data].map do |encoded_pin|
        Pin.new(note: encoded_pin[:note], url: encoded_pin[:original_link], image: encoded_pin[:image][:original][:url])
      end
    end

    def self.decode_pin(encoded_pin_json)
      encoded_pin = JSON.parse(encoded_pin_json).deep_symbolize_keys[:data]

      pin = PinInfo.new
      pin.pin_uuid = encoded_pin[:id]
      pin.note = encoded_pin[:note]
      pin.link = encoded_pin[:original_link]
      pin.image_url = encoded_pin[:image][:original][:url]

      raise RuntimeError.new(pin.errors.full_messages.join(', ')) unless pin.valid?

      pin
    end

    def self.decode_boards(encoded_boards_json)
      encoded_boards = JSON.parse(encoded_boards_json).deep_symbolize_keys[:data]

      boards = []

      encoded_boards.each do |encoded_board|
        board = Board.new
        board.board_uuid = encoded_board[:id]
        board.name = encoded_board[:name]

        raise RuntimeError.new(board.errors.full_messages.join(', ')) unless board.valid?

        boards << board
      end

      boards
    end
  end
end