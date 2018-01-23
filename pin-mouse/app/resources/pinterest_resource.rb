class PinterestResource
  include HTTParty
  base_uri 'https://api.pinterest.com/v1/'

  def self.retrieve_pins
    # Simulations::SimulatedPinResource.retrieve
    # PinResource.retrieve

    response = get("https://api.pinterest.com/v1/me/pins/?access_token=${ENV['PINTEREST_ACCESS_TOKEN']}&fields=id,creator,note,image,link,url&limit=10")

    File.write("dump/PinterestResource_retrieve_pins.json", response)

    adapter.decode_pins(response.body)
  end

  def self.retrieve_boards
    response = get("https://api.pinterest.com/v1/me/boards/?access_token=${ENV['PINTEREST_ACCESS_TOKEN']}&fields=id,creator,name,url&limit=20")
  end

  def self.create_pin(pin)

    post("https://api.pinterest.com/v1/pins/?access_token=${ENV['PINTEREST_ACCESS_TOKEN']}",
                  body: {
                      board: '856176647848747140',
                      note: 'testing pin creation',
                      image_url: 'https://cdn.pixabay.com/photo/2016/11/01/23/38/beach-1790049_960_720.jpg'
                  })

    # root:{} 3 items
    # board:856176647848747140
    # note:testing pin creation
    # image_url:https://cdn.pixabay.com/photo/2016/11/01/23/38/beach-1790049_960_720.jpg

  end

  private

  def self.adapter
    Adapters::PinterestAdapter
  end
end