class PinInfo
  include ActiveModel::Model

  attr_accessor :pin_uuid, :note, :link, :image_url

  validates :pin_uuid, presence: true
  validates :note, presence: true
  validates :link, presence: true
  validates :image_url, presence: true

end