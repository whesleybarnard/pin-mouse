class PinterestResource < BaseResource
  def self.retrieve_pin(pin_uuid)
    response = call_api(
        :get,
        "https://api.pinterest.com/v1/pins/#{pin_uuid}/?access_token=#{ENV['PINTEREST_ACCESS_TOKEN']}&fields=id,link,note,url,image,media,original_link,attribution,board,color,counts,created_at,creator,metadata",
        [200]
    )

    File.write("pinterestResource_retrieve_pin_info.json", response)
    adapter.decode_pin(response.body)
  end

  def self.retrieve_boards
    response = call_api(
        :get,
        "https://api.pinterest.com/v1/me/boards/?access_token=#{ENV['PINTEREST_ACCESS_TOKEN']}&fields=id,creator,name,url&limit=20",
        [200]
    )

    File.write("pinterestResource_retrieve_boards.json", response)
    adapter.decode_boards(response.body)
  end

  # def self.retrieve_pins
  #   # Simulations::SimulatedPinResource.retrieve
  #   # PinResource.retrieve
  #
  #   response = get("https://api.pinterest.com/v1/me/pins/?access_token=#{ENV['PINTEREST_ACCESS_TOKEN']}&fields=id,creator,note,image,link,url&limit=10")
  #
  #   File.write("pinterestResource_retrieve_pins.json", response)
  #
  #   adapter.decode_pins(response.body)
  # end

  def self.create_pin(scheduled_Pin)
    response = call_api(
        :post,
        "https://api.pinterest.com/v1/pins/?access_token=#{ENV['PINTEREST_ACCESS_TOKEN']}&fields=id,link,note,url,image,media,original_link,attribution,board,color,counts,created_at,creator,metadata",
        [201],
        {
            board: scheduled_Pin.board_uuid,
            note: scheduled_Pin.note,
            link: scheduled_Pin.link,
            image_url: scheduled_Pin.image_url
        }
    )

    File.write("pinterestResource_create_pin.json", response)
    adapter.decode_pin(response.body)
  end

  private

  def self.adapter
    Adapters::PinterestAdapter
  end
end