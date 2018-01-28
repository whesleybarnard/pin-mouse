class PinterestResource < BaseResource
  def self.retrieve_pin(pin_uuid)

    response = call_api(
        :get,
        "https://api.pinterest.com/v1/pins/#{pin_uuid}/?access_token=#{ENV['PINTEREST_ACCESS_TOKEN']}&fields=id%2Clink%2Cnote%2Curl%2Cimage%2Cmedia%2Coriginal_link%2Cattribution%2Cboard%2Ccolor%2Ccounts%2Ccreated_at%2Ccreator%2Cmetadata",
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

  # def self.create_pin(pin)
  #   post("https://api.pinterest.com/v1/pins/?access_token=${ENV['PINTEREST_ACCESS_TOKEN']}",
  #        body: {
  #            board: '856176647848747140',
  #            note: 'testing pin creation',
  #            image_url: 'https://cdn.pixabay.com/photo/2016/11/01/23/38/beach-1790049_960_720.jpg'
  #        })
  #
  #   # root:{} 3 items
  #   # board:856176647848747140
  #   # note:testing pin creation
  #   # image_url:https://cdn.pixabay.com/photo/2016/11/01/23/38/beach-1790049_960_720.jpg
  # end

  private

  def self.adapter
    Adapters::PinterestAdapter
  end
end